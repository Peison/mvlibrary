<?php

require 'BaseController.php';
class userController extends  BaseController{
	public function  actionIndex(){
		if(empty($_POST)){
			$this->layout = "display:none";
            $redirect = base64_decode($_GET['path']);
			$this->render("index-1",array("action"=>"?r=user","redirect"=>$redirect));
		}else{
			$usename = $_POST['UserName'];
			$passwd = $_POST['PassWord'];
			$num = User::model()->find("UserName= :username and PassWord = :passwd",
										array(':username'=>$usename,":passwd"=>$passwd));						
			if(!empty($num)){
				Yii::app()->session["login"] = true;
				Yii::app()->session["userName"] = $num->UserName;
				Yii::app()->session["userID"] = $num->UserID;
				echo 1;
			}else{
				echo 0;
			}
		}
	}

	public function  actionSignUp(){
		if(empty($_POST)){
			$this->layout = "display:none";
			$this->render("signUp-1",array("action"=>"?r=user/SignUp"));
		}else{			
			$user = new User();
			$user->UserName = $_POST['UserName'];
			$user->Password = $_POST['PassWord'];
			$bool = $user->save();

            if($bool){
                $set = new Set();
                $set->UserID = $user->UserID;
                $set->SetName = "我喜欢的电影";
                $set->CreatTime = date("y-m-d H:i:s");
                $set->Remark = "system create";
                $set->Photo = "/public/photo/movie.jpg";
                $set->save();
                $this->redirect("?r=user");
            }
		}
	}
	
	
	public function actionLogOut(){
		unset(Yii::app()->session["login"]);
		unset(Yii::app()->session["userName"]);
		unset(Yii::app()->session["userID"]);
		$this->redirect("?r=mvlibrary");
	}

    public function actionUcenter(){
        $this->layout = "display:none";
        $id = $_GET['id'];

        //判断是否进入自己的个人页面
        $loginUser = Yii::app()->session['userID'];
        if($loginUser == $id){
            $self = true;
        }else{
            $self = false;
        }
        $user = User::model()->find("userID = :userID",array(":userID" => $id));
        $set = Set::model()->findAll("userID = :uid",array(':uid' => $id));

        $collect = SetCollect::model()->getSetCollectByUserID($id);
        $passage = Passage::model()->getPassageByUserID($id);
        $countDict = Set::model()->getSetsCount();
        $this->render("Ucenter",array('user'=>$user,'set' => $set,"setCount"=>$countDict,"passages"=>$passage,"collect"=>$collect,"self"=>$self));
    }

    public function actionSetDetail(){
        $this->layout = "display:nonoe";
        $setID = $_GET['id'];
        $set = Set::model()->getSetsByID($setID);
        $moviesTmp = Set::model()->getMoviesOfSet($setID);

        $movie = $tmp = array();
        for($i = 0; $i < count($moviesTmp); $i++){
            $tmp[] = $moviesTmp[$i];
            if($i%8 == 0 && $i != 0){
                $movie[] =$tmp;
                $tmp = array();
            }
        }
        $movie[] = $tmp;

        //判断是否进入自己的个人页面
        $loginUser = Yii::app()->session['userID'];
        if(empty($loginUser)){
            $nologin = true;
            $self = false;
        }
        else if($loginUser == $set[0]['UserID']){//未登录或者是本人登录，不允许点击收藏按钮
            $nologin = false;
            $self = true;
        }else{
            $nologin = false;
            $self = false;
        }

        $this->render("SetDetail",array('set'=>$set[0],'movies'=>$movie,"count"=>count($moviesTmp),"self"=>$self,"nologin"=>$nologin));
    }

    public function actionUserCollect(){
        $setID = $_POST['setID'];
        $userID = Yii::app()->session['userID'];

        $flag = SetCollect::model()->count("SetID = :setID and UserID = :userID",
                                          array(':setID'=>$setID,":userID"=>$userID));
        if($flag == 0){
            $setCollect = new SetCollect();
            $setCollect->SetID = $setID;
            $setCollect->UserID = $userID;
            $setCollect->save();
            echo "收藏成功";
            exit;
        }
        echo "你已经收藏";
        exit;
    }

}