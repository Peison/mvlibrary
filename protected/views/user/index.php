<html>
<head>
	<meta charset="utf-8">
	<style>
		a{
			text-decoration:none;
		}
	</style>
</head>
<body>
	<h3>登录</h3>
	<hr>
	<span id="tips" style="color: red;margin-bottom:10px;"></span>
	<form action="<?php echo $action;?>" method="post" id="login">
		用户名：&nbsp;&nbsp;<input type="text" name="UserName"><br>
		密码 : &nbsp;&nbsp;&nbsp;<input type="password" name="PassWord"><br>		
		<input type="button" value="提交" id="btn">
	</form>
</body>
</html>
<script src="public/bootstrap-3.2.0-dist/js/jquery-1.11.1.min.js"></script>
<script >
	$(document).ready(function(){
		$('#btn').click(function(){
			var username = $("input[name='UserName']").val();
			var passwd = $("input[name='PassWord']").val();			

			if(username == "")	
				$('#tips').html("用户名不能为空");
			else if(passwd == ""){
				$('#tips').html("密码不能为空");
			}else{				
				$.post('<?php echo $action?>',{'UserName':username,'PassWord':passwd},function(msg){										
					if(msg == 0){
						$('#tips').html("帐户名不存在或密码错误");
					}else{
						window.location.href="<?php echo $redirect?>";
					}	
				});								
			}
		});
		
	});
</script>