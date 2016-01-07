<?php
/**
 * @author Peison
 * 后台电影增删查改功能
 * 2014-10-29
 * */
class masterController extends Controller {
	
	/* 后台主页 */
	public function actionIndex() {
		$this->before();
		$this->render ( "index" );
	}
	
	/* 电影信息录入功能 */
	public function actionAddMovie() {
		$this->before();
		if (empty ( $_POST ))
			$this->render ( "addMovie",array("title" => "新增电影") );
		else {
			$movie = new Movie ();
			var_dump($movie);
			$movie->attributes = $_POST;														
			$movie->insert ();			
						
			// 添加标签
			foreach ( $_POST ['tag'] as $tag ) {
				$is_type = new IsType ();
				$is_type->MovieID = $movie->MovieID;
				$is_type->Type = $tag;
				
				$is_type->insert ();
			}
			
			$this->redirect("?r=master/ManageMovie");
		}
	}
	
	/* 电影海报上传--文件上传 */
	public function actionFileUpload() {
		if ($_FILES ["Poster"] ["type"] != "image/gif" && $_FILES ["Poster"] ["type"] != "image/jpeg" && $_FILES ["Poster"] ["type"] != "image/png") {
			echo "<script>window.parent.UploadFile(\"格式错误,请提交JPEG，gif，png格式文件\")</script>";
			return;
		}
		
		$imageDir = "public/photo/";
		
		$pos = strripos ( $_FILES ["Poster"] ["name"], "." );
		$typeName = substr ( $_FILES ["Poster"] ["name"], $pos );
		$imageName = date ( "YmdGis", time () ) . $typeName;
		$store_in = $imageDir . $imageName;
		
		move_uploaded_file ( $_FILES ["Poster"] ["tmp_name"], $store_in );
		
		$store_in .= "|success";
		echo "<script>window.parent.UploadFile(\"$store_in\")</script>";
	}
	
	/* 电影信息展示，管理--分页操作 */
	public function actionManageMovie() {
		$this->before();
		$count = Movie::model ()->count ();
		$page = new CPagination ( $count );
		$page->pageSize = empty ( $_GET ['itemNum'] ) ? 8 : $_GET ['itemNum'];
		
		$criteria = new CDbCriteria ();
		$criteria->select = "MovieID,Title,Director,Starts,Rating,Contury,IssueDate,Poster";
		$page->applyLimit ( $criteria );
		$criteria->order = "IssueDate desc";
		$movies = Movie::model ()->findAll ($criteria);
		
		foreach ( $movies as $movie ) {
			$movs [] = $movie->attributes;
		}
		$this->render ( "manageMovie", array (
				"page" => $page,
				"movies" => $movs,
				"num" => $page->pageSize 
		) );
	}
	
	/* 删除电影 */
	public function actionDeleteMovie() {
		$id = $_POST ["id"];
		$path = $_POST["path"];
		
		// 外键引用是设置了级联删除，is_type表中相关记录会自动删除
		$dbTrain = Yii::app()->db->beginTransaction();		
		$rtn = Movie::model ()->deleteByPk ( $id );
		
		$rst = true;
		if(file_exists($path))
			$rst = unlink($path);		
		
		if ($rtn > 0 && $rst == true) {
			$dbTrain->commit();
			echo 1;
		} else {
			$dbTrain->rollback();
			echo 0;
		}
	}
	/*修改电影--一对多关系的更新  */
	public function actionUpdateMovie(){
		$this->before();
		if(empty($_POST)){
			$id = $_GET["id"];		
			$movie = Movie::model()->findByPK($id);
			$sql = "select Type from is_type where MovieID = $id";
			$type = Yii::app()->db->createCommand($sql)->queryAll(); 
// 	 		$type = IsType::model()->findAll("Type","MovieID = :id",array(":id" => $id));
			$tags = array();
			foreach ($type as $item){
				$tags[] = $item['Type'];
			}
			
			$this->render("addMovie",array("movie"=>$movie,"tags"=>$tags,"title"=>"编剧电影"));
		}else{
			$id = $_POST['Id'];			
			$movie = Movie::model()->findByPK($id);
			$movie->attributes = $_POST;
			$movie->save();
			
			//标签更新，粗暴写法=_=			
			$sql = "delete from is_type where MovieID = $id";
			Yii::app()->db->createCommand($sql)->execute();
			foreach ( $_POST ['tag'] as $tag ) {
				$is_type = new IsType ();
				$is_type->MovieID = $movie->MovieID;
				$is_type->Type = $tag;
				
				$is_type->insert ();
			}
			$this->redirect("?r=master/ManageMovie");
		}
		
	}
	
	
	public function actionlogin(){
		if(empty($_POST)){
			$this->layout = "display:none";
			$this->render("../user/index-1",array("action"=>"?r=master/login","redirect"=>"r=master"));
		}else{
			$usename = $_POST['UserName'];
			$passwd = $_POST['PassWord'];
				
			$num = Admin::model()->find("AdminName= :username and passWord = :passwd",
					array(':username'=>$usename,":passwd"=>$passwd));
			if(!empty($num)){
				Yii::app()->session["admin#login"] = true;
				Yii::app()->session["AdminName"] = $num->AdminName;
// 				Yii::app()->session["AdminID"] = $num->AdminID;
				echo 1;
			}else{
				echo 0;
			}
		}
	}
	
	public function actionSign(){
		$this->before();
		if(empty($_POST)){
			$this->layout = "display:none";
			$this->render("../user/signUp-1",array("action"=>"?r=master/sign"));
		}else{			
			$admin = new Admin(false);
			$admin->AdminName = $_POST['UserName'];
			$admin->Password = $_POST['PassWord'];			
			$admin->insert();
			$this->redirect("?r=master/login");
		}
	}
	
	
	public function actionLogOut(){		
		unset(Yii::app()->session["admin#login"]);
		unset(Yii::app()->session["AdminName"]);
		$this->redirect("?r=master/login");
	}
	
	/*登录前禁止访问，跳转到登录页面*/
	public function  before(){
		if(!isset(Yii::app()->session["admin#login"]) || Yii::app()->session["admin#login"] != true)
			$this->redirect("?r=master/login");			
	}


    public function actionVedioUpload(){
        $movieID =  $_GET['id'];
        $this->render("vedioUpload",array('movieID'=>$movieID));
    }

    public function actionAjaxUpload(){
        $movieID = $_POST['id'];
        $vedioPath = "public/vedio";
        $pos = strripos($_FILES['file_data']['name'],'.');
        $type = substr($_FILES['file_data']['name'],$pos-1);

        $fileName = $movieID.$type;
        $vedioPath .='/'.$fileName ;
        move_uploaded_file($_FILES['file_data']['tmp_name'],$vedioPath);

        $newStr = '<source src="'.$vedioPath.'" type="'.$_FILES['file_data']["type"].'" />';
        $movie = Movie::model()->find("MovieID = :id",array(":id" => $movieID));
        $movie->Source .= $newStr;
        $movie->save();

        echo json_encode(array());
        exit;
    }
}

?>