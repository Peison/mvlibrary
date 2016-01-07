<html>
<head>
	<meta charset="utf-8">
</head>
<body>
	<h3>注册</h3>
	<hr>
	<span id="tips" style="color: red;margin-bottom:10px;"></span>
	<form action="<?php echo $action;?>" method="post" id="sign">
		用户名：&nbsp;&nbsp;<input type="text" name="UserName"><br>
		密码 : &nbsp;&nbsp;&nbsp;<input type="password" name="PassWord"><br>
		密码确认：<input type="password" name="PassWdVal"><br>
		<input type="button" value="提交" id="btn">
	</form>
</body>
</html>
<script src="public/bootstrap-3.2.0-dist/js/jquery-1.11.1.min.js"></script>
<script >
	$(document).ready(function(){
		$('#btn').click(function(){
			var username = $("input[name='UserName']").val();
			var passwd1 = $("input[name='PassWord']").val();
			var passwd2 = $("input[name='PassWdVal']").val();			
			if(username == "")	
				$('#tips').html("用户名不能为空");
			else if(passwd1 == ""){
				$('#tips').html("密码不能为空");
			}else if(passwd2 != passwd1){
				$('#tips').html("两次输入密码不一致");
			}else{				
				$('#sign').submit();
			}
		});
		
	});
</script>