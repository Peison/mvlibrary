<div class="row"
	style="background-color: #000030; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444; width: 100%">
	<div class="col-md-2 visible-lg visible-md">
		<a href="?r=mvlibrary" style="text-decoration: none"><h3 style="color: #FFFFFF">MVlibrary</h3></a>
	</div>
	<div class="clearfix visible-xs"></div>
	<div class="col-md-3 col-sm-3 col-xs-8"
		style="padding: 15px 0px 0px 0px;">
		<form action="?r=mvlibrary" method="post">
			<div class="input-group input-group-md">
				<input type="text" class="form-control" name="search" placeholder="电影，导演，主演">
				<span class="input-group-btn">
					<button class="btn btn-primary" type="submit">搜索</button>
				</span>
			</div>
		</form>
	</div>
	<div class="clearfix visible-xs"></div>
	<div class="col-md-4 col-md-offset-1 col-sm-6 col-sm-offset-1 col-xs-8"
		style="padding: 15px 0px 0px 0px;">
		<div class="btn-group">
			<div class="btn-group">
				<div class="dropdown">
					<button type="button" class="btn btn-primary dropdown-toggle"
						id="dropdownMenu1" data-toggle="dropdown">
						分类 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu multi-level" role="menu"
						aria-labelledby="dropdownMenu">
						<li class="dropdown-submenu"><a tabindex="-1"
							href="javascript:;">类型</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="javascript:;" class="type">喜剧</a></li>
								<li><a tabindex="-1" href="javascript:;" class="type">科幻</a></li>
								<li><a tabindex="-1" href="javascript:;" class="type">爱情</a></li>
								<li><a tabindex="-1" href="javascript:;" class="type">动作</a></li>
								<li><a tabindex="-1" href="javascript:;" class="type">励志</a></li>
								<li><a tabindex="-1" href="javascript:;" class="type">黑色幽默</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a tabindex="-1"
							href="javascript:;">国家</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="javascript:;" class="contury">美国</a></li>
								<li><a tabindex="-1" href="javascript:;" class="contury">欧洲</a></li>
								<li><a tabindex="-1" href="javascript:;" class="contury">日韩</a></li>
								<li><a tabindex="-1" href="javascript:;" class="contury">大陆</a></li>
								<li><a tabindex="-1" href="javascript:;" class="contury">香港</a></li>
								<li><a tabindex="-1" href="javascript:;" class="contury">俄罗斯</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a tabindex="-1"
							href="javascript:;">年代</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="javascript:;" class="time">2010-2014</a></li>
								<li><a tabindex="-1" href="javascript:;" class="time">2000-2009</a></li>
								<li><a tabindex="-1" href="javascript:;" class="time">1990-1999</a></li>
								<li><a tabindex="-1" href="javascript:;" class="time">1980-1989</a></li>
								<li><a tabindex="-1" href="javascript:;" class="time">1970-1979</a></li>
								<li><a tabindex="-1" href="javascript:;" class="time">1960-1969</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<button type="button" class="btn btn-primary type" >最新电影</button>
			<button type="button" class="btn btn-primary type" >近期热映</button>
			<button type="button" class="btn btn-primary type" >经典大片</button>
		</div>
	</div>
	<div class="col-md-2 col-sm-2 col-xs-4"
		style="padding: 15px 0px 0px 0px;">
		<?php if( $login != true) {?>
		<div class="btn-group">
			<a href="?r=user&path=<?=$path?>"><button type="button" class="btn btn-primary">登录</button></a>
			<a href="?r=user/signUp"><button type="button" class="btn btn-primary">注册</button></a>
		</div>
		<?php }else{?>
		<div class="logout">
			<a href="?r=user/Ucenter&id=<?=$userID?>"><?php echo $userName;?></a>
			<a href="?r=user/logOut"><span>退出登录</span></a>
		</div>
		<?php }?>
	</div>
</div>
<script>
		$(document).ready(function(){
			$(".type").click(function(){
				var type = $(this).html();
				var tmp = parseInt(Math.random()*1000);
				window.location.href="?r=Mvlibrary&type="+type+"&tmp="+tmp;
			});

			$(".contury").click(function(){
				var contury = $(this).html();
				var tmp = parseInt(Math.random()*1000);
				window.location.href="?r=Mvlibrary&contury="+contury+"&tmp="+tmp;
			});

			$(".time").click(function(){
				var time = $(this).html();
				var tmp = parseInt(Math.random()*1000);
				window.location.href="?r=Mvlibrary&time="+time+"&tmp="+tmp;
			});

		})
</script>