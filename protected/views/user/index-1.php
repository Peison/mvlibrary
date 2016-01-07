<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录页</title>
    <link rel="stylesheet"  href="/public/bootstrap-3.2.0-dist/css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="/public/css/Base.css">
<style>
    body{
        background-color: #EFEFEF;
    }
    .login{
        width: 32%;
        height: 230px;
        margin: 12% auto;
        border: rgba(0, 0, 0, 0.2) 1px solid;
        background-color: #FFFFFF;
        box-shadow: 0 2px 5px rgba(0,0,0,.5);
    }
    .headline{
        font-size: 20px;
        padding: 5px 0px 0px 15px;
    }
    .headline span{
        font-size: 14px;
    }

    #field{
        margin: 15px 0px;
    }
</style>
</head>

<body>
	<div class="login">
		<div class="content-login">
			<div class="headline">
                <?php if($action == "?r=master/login") echo "管理员"; else echo "用户";?>登录
                <span id="tips" style="color: red;margin-bottom:0px;"></span>
            </div>
            <hr>
            <form class="form-horizontal" role="form" action="<?=$action?>" method="post">
            <div class="form-group" id="field">
                <div class="col-sm-12">
                    <input type="text" class="form-control"  name="UserName"
                           placeholder="请输入名字">
                </div>
            </div>
            <div class="form-group" id="field">
                <div class="col-sm-12">
                    <input type="password" class="form-control"  name="PassWord"
                           placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-2">
                    <a class="btn btn-login btn-primary">登录</a>
                </div>
                <div class="col-sm-offset-1 col-sm-4">
                    <a href="?r=user/SignUp" class="btn btn-default">注册</a>
                </div>
            </div>
        </form>
	</div>
</body>
</html>
<script src="public/bootstrap-3.2.0-dist/js/jquery-1.11.1.min.js"></script>
<script >
	$(document).ready(function(){
		$('.btn-login').click(function(){

			var username = $("input[name='UserName']").val();
			var passwd = $("input[name='PassWord']").val();

			if(username == ""){
				$('#tips').html("用户名不能为空");
                return false;
            }
			else if(passwd == ""){
				$('#tips').html("密码不能为空");
                return false;
			}else{
				$.post('<?php echo $action?>',{'UserName':username,'PassWord':passwd},function(msg){
					if(msg == 0){
						$('#tips').html("帐户名不存在或密码错误");
					}else{
						window.location.href="?<?php echo $redirect?>";
					}
				});
			}
		});

        $('form').keydown(function(e){
            if(e.keyCode==13){
                $('.btn-login').click();
            }
        });
	});
</script>


