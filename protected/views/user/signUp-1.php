<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册页</title>
    <link rel="stylesheet"  href="/public/bootstrap-3.2.0-dist/css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="/public/css/Base.css">
<style>
    body{
        background-color: #EFEFEF;
    }
    .login{
        width: 32%;
        height: 250px;
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
                <?php if($action == "?r=master/sign") echo "管理员"; else echo "用户";?>注册
                <span id="tips" style="color: red;"></span>
            </div>
		</div>
        <form class="form-horizontal" role="form" action="<?=$action?>" method="post" id="sign">
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
            <div class="form-group" id="field">
                <div class="col-sm-12">
                    <input type="password" class="form-control"  name="PassWdVal"
                           placeholder="请再次输入密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-4">
                    <a  class="btn btn-primary btn-default">注册</a>
                </div>
            </div>
        </form>
	</div>
</form>
</body>
</html>
<script src="public/bootstrap-3.2.0-dist/js/jquery-1.11.1.min.js"></script>
<script >
	$(document).ready(function(){
		$('.btn').click(function(){
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

        $('form').keydown(function(e){
            if(e.keyCode==13){
                $('.btn').click();
            }
        });
	});
</script>