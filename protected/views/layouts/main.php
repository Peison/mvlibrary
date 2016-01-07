<html>
<head>
	<title>后台</title>
	<?php require_once 'protected/views/mvlibrary/header.php';?>
	<link rel="stylesheet" href="public/bootstrap-3.2.0-dist/css/bootstrap.min.css">
    <script src="/public/bootstrap-3.2.0-dist/js/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" href="public\css\Master.css"/>
</head>
<body>
	<div class="container">
		<div class="banner">
			<ul>
				<li><a href="?r=master">仪表盘</a></li>
				<li><a href="?r=master/AddMovie">电影添加</a></li>
				<li><a href="?r=master/ManageMovie">电影管理</a></li>
			</ul>
			<div class="back">			
				<span>当前管理员：<?php echo  Yii::app()->session["AdminName"];?></span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="?r=master/logOut">登出</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="?r=master/sign">注册</a>
				<a href="?r=Mvlibrary" target="_blank">前台</a>
			</div>
			<div style="clear:both;"></div>				
			<hr>			
		</div>
		<div class="clear"></div>
		<?php echo $content?>		
				
		<?php require_once 'protected/views/mvlibrary/footer.php';?>
	</div>
</body>
</html>
