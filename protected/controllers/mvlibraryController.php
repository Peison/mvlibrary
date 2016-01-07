<?php
require 'BaseController.php';
class MvlibraryController extends BaseController {
	//默认路由
	public function  actionIndex(){
		if(!empty($_POST["search"])){
			$search = $_POST["search"];
			$sql = "select MovieID,Title,Poster from Movie 
					where Title like '%$search%' or Starts like '%$search%' or Director like '%$search%'";			
			
		}else if(!empty($_GET["type"])){
			$type = $_GET["type"];			
			$sql = "select MovieID,Title,Poster from Movie natural join is_type where Type like '%$type%'";					
		}else if(!empty($_GET["contury"])){
			$contury = $_GET['contury'];
			$sql = "select MovieID,Title,Poster from Movie where contury like '%$contury%'";
		}else if(!empty($_GET['time'])){
			$time = explode('-', $_GET['time']);
			$start = $time[0]."-01-01";
			$end = $time[1]."-12-31";
			
			$sql = "select MovieID,Title,Poster from Movie where IssueDate >= '$start' and IssueDate <= '$end'";
		}		
		else{			
			$sql = "select MovieID,Title,Poster from Movie";									
		}
				
		$movie = Yii::app()->db->createCommand($sql)->queryAll();		
		$this->layout = "display:none";
		$this->render('homePage',array("movie" => $movie));
	}

	
	public function actionmovie(){
		$id = $_GET["id"];
		$movie = Movie::model()->findByPK($id);
        $videoLink = empty($movie->Source)?"#":"?r=mvlibrary/vedioPlay&id={$id}";
		$tags = IsType::model()->findAll("MovieID = :ID", array("ID" => $movie->MovieID));
		
		$tag = "";
		foreach ($tags as $item){
			$tag .= $item['Type'].",";
		}
		$tag = substr($tag, 0, strlen($tag)-1);//电影类型

        $comms = Comment::model()->getCommentByMovieID($id);//短评

        $passages = Passage::model()->getPassageByMovieID($id);//长评

        $userid = Yii::app()->session['userID'];
        if(!empty($userid)){
            $login = true;
        }else{
            $login = false;
        }

        $sets = array();
        if(isset($userid)){
            $sets = Set::model()->findAll("UserID = :userId",array(":userId" => $userid));
        }

        $this->layout = "display:none";
		$this->render("movie", array("movie"=>$movie,"tag"=>$tag,"comms"=>$comms,"passages"=>$passages,"sets"=>$sets,"login"=>$login,"vedioLink"=>$videoLink));
	}
	public function actionaddComment(){
		$comment = new Comment();
		$comment->MovieID = $_POST['MovieID'];
		if(isset(Yii::app()->session['userID']))
			$comment->UserID = Yii::app()->session['userID'];
		else{
			$comment->UserID = 0;
		}
		  				
		$comment->Content = str_replace("\n", "<br>",$_POST['Content']);						
		$comment->IssueDate = date("Y-m-d H:i:s",time());		
		$comment->save();
		
		$this->redirect("?r=mvlibrary/movie&id=$comment->MovieID&#comm");
	}


    public function actionPassage(){
        $this->layout = "display:none";
        if(empty($_POST)){
            if(!isset(Yii::app()->session['userID'])){
                $this->redirect("?r=user&path=".$_GET['path']);
            }
            $movieId = $_GET['movieID'];
            $usid= Yii::app()->session['userID'];

            $mod = Passage::model()->find('MovieID = :movieID and UserID = :userID',
                array(":movieID" => $movieId,":userID" => $usid));
            if(empty($mod)){
                $mod = new Passage();
            }

            //电影名字
            $movie = Movie::model()->find("MovieID = :movieID",array(":movieID" => $movieId));
            $this->render("passage",array("movieID"=>$movieId,"userID"=>$usid,"passage"=>$mod,"movieTitle"=>$movie['Title']));
        }else{
            $mod = Passage::model()->find('MovieID = :movieID and UserID = :userID',
                array(":movieID" => $_POST['movieID'],":userID" => $_POST['userID']));
            if(empty($mod)){
                $mod = new Passage();
            }
            $mod->MovieID = $_POST['movieID'];
            $mod->UserID = $_POST['userID'];
            $mod->Title = $_POST['title'];
            $mod->Mark = $_POST['mark'];
            $mod->Content = $_POST['content'];
            $mod->IssueDate = date('Y-m-d H:i:s');
            $mod->ShortCut = self::cut($_POST['content']);
            $mod->save();
            $this->redirect("?r=Mvlibrary/movie&id=".$_POST['movieID']);
        }

    }

    //看长评-仔细页面
    public  function  actionViewPassage(){
        $id = $_GET['id'];
        $userID = Yii::app()->session['userID'];

        if(empty($userID)){
            $flag = -1;//未登录，不能点赞
        }else{
            $flag = Evelate::model()->count("UserID = :user and PassageID = :passageID",
                array(":user" => $userID,":passageID" =>$id));
        }

        $mod = Passage::model()->getPassageByID($id);
        $this->layout = "display:none";
        $this->render("viewPassage",array("passage" => $mod['0'],'flag'=>$flag));
    }

    //获取长评的前400个字
    public function cut($str=""){
        //网上抄的，好好研究
        $str = preg_replace("/(\s|\&nbsp\;|　|\xc2\xa0)/", "", strip_tags($str));

        return substr($str,0,400);

    }

    //点赞功能-ajax
    public  function  actionEvelate(){
        $userID = Yii::app()->session['userID'];
        $passageID = $_POST['id'];
        $evelate = ($_POST['mod'] == "up" )? "GoodTime":"BadTime";
        $flag = Evelate::model()->count("UserID = :user and PassageID = :passageID",
                                array(":user" => $userID,":passageID" =>$passageID));

        $transaction = YiiBase::app()->db->beginTransaction();
        try{
            if($flag == 0){
                $mod = new Evelate();
                $mod->UserID = $userID;
                $mod->PassageID = $passageID;
                if($mod->save()){
                    Passage::model()->updatePassageByID($passageID,$evelate);
                }
            }else{
                echo json_encode(array("Status" => false));
                exit;
            }
        }catch (Exception $e){
            $transaction->rollback();
            echo json_encode(array("Status" => false));
            exit;
        }

        $transaction->commit();
        echo json_encode(array("Status" => true));
        exit;
    }

    //改成ajax提交，返回提示信息，去除重定向,加上图片合成功能
    public function actionCollect(){
        $newSetName = $_REQUEST['newSetName'];
        $movieID = $_REQUEST['movieID'];
        $setID = $_REQUEST['setID'];

        if(!empty($newSetName)){
            $set = new Set();
            $set->SetName = $newSetName;
            $set->UserID = Yii::app()->session['userID'];
            $set->CreatTime = date("Y-m-d H:i:s");
            $set->insert();
            $setID = $set->SetID;
        }

        $falg = SetMovie::model()->find("SetID = $setID and MovieID = $movieID");

        if(empty($falg)){
            $movieInSet = new SetMovie();
            $movieInSet->SetID = $setID;
            $movieInSet->MovieID = $movieID;
            $movieInSet->save();

            if(!isset($set)){//已有的影单再合成图片之前删除已有的图片
                $set = Set::model()->find('SetID = :setid',array(':setid' => $setID));
                if(!strstr($set->Photo,'movie') && file_exists($set->Photo)){
                    unlink($set->Photo);
                }
            }
            $set->Photo = self::actionGeneratePhoto($setID);
            $set->save();
            echo json_encode(array('status' => true,'msg' => '收藏成功'));
        }else{
            echo json_encode(array('status' => false,'msg' => '电影已存在'));
        }
    }

    //ajax
    public function actionGetSetsOfUser(){
        $userid = Yii::app()->session['userID'];
        $sets = array();
        if(isset($userid)){
            $sets = Set::model()->findAll("UserID = :userId",array(":userId" => $userid));
        }
        $tmp = array();
        foreach($sets as $set){
            $tmp[] = $set->attributes;
        }

        echo json_encode($tmp);
        exit;
    }

    //ajax
    public function actionDeleteSetMovie(){
        $movieID = $_POST['movieID'];
        $setID  = $_POST['setID'];

        if(SetMovie::model()->deleteAll('MovieID = :mid And SetID = :sid',array(":mid" => $movieID, ":sid" => $setID))){
            $set = Set::model()->find('SetID = :sid',array(":sid" => $setID));
            $oldpath = $set->Photo;
            $set->Photo = self::actionGeneratePhoto($setID);

            if($set->save()){
                unlink($oldpath);
            }
        }
        exit;
    }

    //ajax
    public function actionDeleteSet(){
        $setID  = $_POST['setID'];
        $set = Set::model()->find('SetID = :sid',array(":sid" => $setID));
        if(empty($setID)) exit;
        $oldpath = $set->Photo;

        $movies = SetMovie::model()->deleteAll('SetID = :sid',array(":sid" => $setID));
        $collect = SetCollect::model()->deleteAll('SetID = :sid',array(":sid" => $setID));
        $delset = Set::model()->deleteAll('SetID = :sid',array(":sid" => $setID));
        if($movies && $collect && $delset){
            unlink($oldpath);
        }
        exit;
    }

    //ajax
    public function actionDeleteCollect(){
        $setID  = $_POST['setID'];
        $UserID = Yii::app()->session['userID'];
        $collect = SetCollect::model()->deleteAll('SetID = :sid and UserID = :uid',array(":sid" => $setID,":uid" => $UserID));
        exit;
    }

    public function actionVedioPlay(){
        $this->layout = "display:none";
        $id = $_GET["id"];
        $movie = Movie::model()->findByPK($id);
        $this->render("vedioPlay",array("movie" => $movie));
    }

    public function actionGeneratePhoto($setID){
        $photos = Set::model()->getMoviesOfSet($setID,'Poster');
        //整理格式
        $imgs = array();
        foreach ($photos as $one) {
            $imgs[] = $one['Poster'];
        }

        $time = time();
        $path = "public/photo/set/$time$setID.jpg";//保持位置
        $width = 395;
        $height = 600;

        if(count($imgs) >= 4){
            $rand = array_rand($imgs,4);//随机取出4个
            $input = array();
            foreach($rand as $k){
                $input[] = $imgs[$k];
            }

            $source= array();
            foreach ($input as $k=>$v){
                $source[$k]['source'] = Imagecreatefromjpeg($v);
                $source[$k]['size'] = getimagesize($v);
            }
            $width = 395;
            $height = 600;
            $target_img = imagecreatetruecolor($width,$height);

            $tmp=0;
            $tmpy=0; //图片之间的间距
            for($i=0; $i<4; $i++){
                $cut = imagecreatetruecolor($width/2,$height/2);
                imagecopyresampled($cut,$source[$i]['source'],0,0,0,0,$width/2,$height/2,$width,$height);
                imagecopy($target_img,$cut,$tmp,$tmpy,0,0,$width/2,$height/2);
                $tmp = $tmp+$width/2;
                if($tmp>= $width){
                    $tmp = 0;
                    $tmpy = $tmpy + $height/2;
                }
            }
            Imagejpeg($target_img,$path);
        }else if(count($imgs) == 3){
            $input = $imgs;
            $source= array();
            foreach ($input as $k=>$v){
                $source[$k]['source'] = Imagecreatefromjpeg($v);
                $source[$k]['size'] = getimagesize($v);
            }
            $target_img = imagecreatetruecolor($width,$height);

            $tmp=$width/4;
            $tmpy=0; //图片之间的间距
            for($i=0; $i<3; $i++){
                $cut = imagecreatetruecolor($width/2,$height/2);
                imagecopyresampled($cut,$source[$i]['source'],0,0,0,0,$width/2,$height/2,$width,$height);
                imagecopy($target_img,$cut,$tmp,$tmpy,0,0,$width/2,$height/2);

                $tmp = $tmp+$width/2;
                if($tmp >= $width/4*3){
                    $tmp = 0;
                    $tmpy = $tmpy + $height/2;
                }
            }
            Imagejpeg($target_img,$path);
        }else if(count($imgs) == 2){
            $input = $imgs;
            $source= array();
            foreach ($input as $k=>$v){
                $source[$k]['source'] = Imagecreatefromjpeg($v);
                $source[$k]['size'] = getimagesize($v);
            }
            $target_img = imagecreatetruecolor($width,$height);

            $tmp=0;
            $tmpy=$width/3; //图片之间的间距
            for($i=0; $i<2; $i++){
                $cut = imagecreatetruecolor($width/2,$height/2);
                imagecopyresampled($cut,$source[$i]['source'],0,0,0,0,$width/2,$height/2,$width,$height);
                imagecopy($target_img,$cut,$tmp,$tmpy,0,0,$width/2,$height/2);

                $tmp = $tmp+$width/2;
            }
            Imagejpeg($target_img,$path);
        }else if(count($imgs) == 1){
            $cut = imagecreatefromjpeg($imgs[0]);
            $target_img = imagecreatetruecolor($width,$height);
            imagecopy($target_img,$cut,0,0,0,0,$width,$height);
            Imagejpeg($target_img,$path);
        }else{
            return '/public/photo/movie.jpg';
        }

        return $path;
    }

    public function actionIniTest(){
//        ob_start("mb_output_handler");
//        ob_implicit_flush(true);
//        ini_set("zlib.output_compression","on");
//        ini_set("zlib.output_compression_level",2);
//        for($i = 0; $i < 50000; $i++){
//            echo md5($i)."_"."<br>";
//            ob_flush();
//            sleep(1);
//        }

//        ini_set('unserialize_callback_func','myCallback');
//        function myCallback(){
//            echo "unserialize error";
//        }
//        $str = serialize(Movie::model()->find("MovieId > 1"));
//        file_put_contents('test.txt',$str);
//        $mov = unserialize(file_get_contents('test.txt'));

//        ini_set('allow_call_time_pass_reference','On');
//        $a = 10;
//        $this->testC(&$a);

        var_dump("sadd");
        exit;
    }

    public function testC($a){
        return $a+1;
    }
}

?>