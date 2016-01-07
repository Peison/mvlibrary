<link rel="stylesheet" href="public/\bootstrap-3.2.0-dist\bootstrap-datetimepicker-master\css\bootstrap-datetimepicker.min.css"  media="screen">
<script type="text/javascript" src="public/\bootstrap-3.2.0-dist\bootstrap-datetimepicker-master\js\bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="public/\bootstrap-3.2.0-dist\bootstrap-datetimepicker-master\js\locales\bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<div class="content row">
	<div class="col-sm-12 title">
		<span style="font-size: 16px;"><?php echo $title?>:</span>
		<span style="font-size: 10px;color:#1F90F1">[标红色*以及电影海报为必填项]</span>			
	</div>		
	<div class="col-sm-9">			
		<form class="form-horizontal" role="form" action="<?php echo isset($movie)?"?r=master/UpdateMovie":"?r=master/addMovie"?>" method="post" id="movie">
			<!-- 片名 -->
			<div class="form-group ">
				<label for="Title" class="col-sm-2 control-label"><span class="star">*
				</span>片名：</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="Title"
						placeholder="请输入电影名字" required="required" value="<?php echo isset($movie)?$movie["Title"]:"";?>">					
				</div>
			</div>
	
			<!-- 导演 -->
			<div class="form-group">
				<label for="Director" class="col-sm-2 control-label"><span
					class="star">* </span>导演：</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="Director"
						placeholder="请输入导演名字" required="required" value="<?php echo isset($movie)?$movie["Director"]:"";?>">
				</div>
			</div>
	
			<!--编剧 -->
			<div class="form-group">
				<label for="Writer" class="col-sm-2 control-label "><span
					class="star">* </span>编剧：</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="Writer"
						placeholder="请输入编剧名字" required="required" value="<?php echo isset($movie)?$movie["Writer"]:"";?>">
				</div>
			</div>
	
			<!--主演 -->
			<div class="form-group">
				<label for="Starts" class="col-sm-2 control-label "><span
					class="star">* </span>主演：</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="Starts"
						placeholder="请输入主演，以逗号分隔" required="required" value="<?php echo isset($movie)?$movie["Starts"]:"";?>">
				</div>
			</div>
	
			<!--评分  -->
			<div class="form-group">
				<label for="Rating" class="col-sm-2 control-label ">评分：</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="Rating"
						placeholder="请输入评分,eg：7.9" value="<?php echo isset($movie)?$movie["Rating"]:"";?>">
				</div>
			</div>
	
			<!--出品国家  -->
			<div class="form-group">
				<label for="Contury" class="col-sm-2 control-label ">出品国家：</label>
				<div class="col-sm-7">				
					<select name="Contury" class="form-control">						
						<option value="美国" <?php if(isset($movie) && $movie["Contury"] == "美国") echo "selected"?>>美国</option>
						<option value="欧洲" <?php if(isset($movie) && $movie["Contury"] == "欧洲") echo "selected"?>>欧洲</option>
						<option value="日韩" <?php if(isset($movie) && $movie["Contury"] == "日韩") echo "selected"?>>日韩</option>
						<option value="大陆" <?php if(isset($movie) && $movie["Contury"] == "大陆") echo "selected"?>>大陆</option>
						<option value="香港" <?php if(isset($movie) && $movie["Contury"] == "香港") echo "selected"?>>香港</option>
						<option value="俄罗斯" <?php if(isset($movie) && $movie["Contury"] == "俄罗斯") echo "selected"?>>俄罗斯</option>
					</select>
				</div>
			</div>
	
			<!--时长-->
			<div class="form-group">
				<label for="TimeSpan" class="col-sm-2 control-label ">时长：</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="TimeSpan"
						placeholder="请输入电影时长，eg：1h35min" value="<?php echo isset($movie)?$movie["TimeSpan"]:"";?>">
				</div>
			</div>
	
			<!--上映时间,时间控件-->
			<div class="form-group">
				 <label for="IssueDate" class="col-sm-2 control-label">上映时间</label>
				 <div class="col-sm-7">
	                <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="IssueDate" data-link-format="yyyy-mm-dd">
	                    <input class="form-control" size="16" type="text" value="<?php echo isset($movie)?$movie["IssueDate"]:"";?>" readonly>                 
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                </div>
					<input type="hidden" id="IssueDate" name="IssueDate" value="<?php echo isset($movie)?$movie["IssueDate"]:"";?>" /><br/>					
				</div>			
			</div>
	
			<!--分类 -->
			<div class="form-group">		
				<label for="name" class="col-sm-2 control-label"><span class="star">* </span>分类：</label>			
				&nbsp;&nbsp;&nbsp;
				<label class="checkbox-inline"> 
					<input type="checkbox" name="tag[]" value="最新电影" <?php if(isset($tags) && in_array("最新电影", $tags))  echo "checked"?>> 最新电影
				</label> 
				<label class="checkbox-inline"> 
					<input type="checkbox" name="tag[]" value="近期热映" <?php if(isset($tags) && in_array("近期热映", $tags))  echo "checked"?>> 近期热映
				</label> 
				<label class="checkbox-inline"> 
					<input type="checkbox" name="tag[]" value="经典大片" <?php if(isset($tags) && in_array("经典大片", $tags))  echo "checked"?>> 经典大片
				</label>
				<span class="tips" id="type">
						
				</span>	
				<br>
				
				<label class="checkbox-inline" style="margin-left: 143px">
					<input type="checkbox" name="tag[]" value="喜剧" <?php if(isset($tags) && in_array("喜剧", $tags))  echo "checked"?>> 喜剧
				</label> 
				<label class="checkbox-inline"> 
					<input type="checkbox" name="tag[]" value="科幻" <?php if(isset($tags) && in_array("科幻", $tags))  echo "checked"?>> 科幻
				</label> 
				<label class="checkbox-inline"> 
					<input type="checkbox" name="tag[]" value="爱情" <?php if(isset($tags) && in_array("爱情", $tags))  echo "checked"?>> 爱情
				</label>  			
				<label class="checkbox-inline"> 
					<input type="checkbox" name="tag[]" value="动作" <?php if(isset($tags) && in_array("动作", $tags))  echo "checked"?>> 动作
				</label> 
				<label class="checkbox-inline"> 
					<input type="checkbox" name="tag[]" value="励志" <?php if(isset($tags) && in_array("励志", $tags))  echo "checked"?>> 励志
				</label> 
				<label class="checkbox-inline"> 
					<input type="checkbox" name="tag[]" value="黑色幽默" <?php if(isset($tags) && in_array("黑色幽默", $tags))  echo "checked"?> > 黑色幽默
				</label>				
			</div>						
			
			<!-- 电影简介 -->
			<div class="form-group">
				<label for="MovieDesc" class="col-sm-2 control-label">电影简介：</label>
				<div class="col-sm-7">
					<textarea class="form-control desc" name="MovieDesc"
						placeholder="请输入电影简介" style="height: 200px; width: 800px;"
					><?php if(!empty($movie["MovieDesc"])) echo $movie["MovieDesc"];?></textarea>
				</div>
			</div>						
			
			<input type="hidden" name="Poster" id="PosterDir" value="<?php echo isset($movie["Director"])?$movie["Poster"]:""?>" required="required">
			<?php if(isset($movie)){?>
				<input type="hidden" name="Id" id="PosterDir" value="<?php echo $movie["MovieID"]?>" required="required">
			<?php }?>
			
				
			<div class="col-sm-offset-6 col-sm-6">
				<button type="button" class="btn btn-primary" style="width:150px;height:50px" onclick="UploadInfo()">提交</button>
			</div>									
		</form>
	</div>
	
	<div class="col-sm-3 poster">
		<!-- 海报，图片上次预览-->	
		<form id="formFile" class="form-horizontal" method="post" enctype="multipart/form-data" action="?r=master/FileUpload" target="frameFile">						
			<div class="form-group">								
					<div class="image">
						<img src="<?php echo isset($movie["Director"])?$movie["Poster"]:"public/photo/mvlibrary.png"?>" alt="电影海报" id="img">
					</div>				
					<div>					
						<input type="file" class="for-control" name="Poster" id="Poster"
							required="required">								
					</div>
					<br>
					<div id="tips" class="tips">							
					</div>					
			</div>			
		</form>
		<iframe name="frameFile" id="frameFile" style="display:none"></iframe>
	</div>		
</div>
<script>
	$('#Poster').change(function(){			
		$("#formFile").submit();	
	});
	function UploadFile(msg) {		
		var rst = msg.split("|");  
		if(rst.length > 1){
			$("#img").attr("src",rst[0]);
			$("#PosterDir").val(rst[0]);					
		}else{
			$("#PosterDir").val("");
			$("#img").attr("src","public/photo/mvlibrary.png");
			alert(msg);						
		}		
	}
	function UploadInfo(){	
		var flag = true;			
		if($("input[name='Title']").val() == ""){			
			$("input[name='Title']").css("border-color","red");		
			flag &= false;
		}else{
			$("input[name='Title']").css("border-color","#CCC");				
		}
		if($("input[name='Director']").val() == ""){
			$("input[name='Director']").css("border-color","red");
			flag &= false;
		}else{
			$("input[name='Director']").css("border-color","#CCC");		
		}
		if($("input[name='Writer']").val() == ""){
			$("input[name='Writer']").css("border-color","red");
			flag &= false;
		}else{
			$("input[name='Writer']").css("border-color","#CCC");			
		}
		if($("input[name='Starts']").val() == ""){
			$("input[name='Starts']").css("border-color","red");
			flag &= false;
		}else{
			$("input[name='Starts']").css("border-color","#CCC");			
		}

		var array = $("input[type='checkbox']");
		for(var i = 0; i < array.length; i++){
			if(array[i].checked == true){
				break;
			}
		}
		if(i >= array.length ){
			$('#type').html("!请至少选择一项");
			flag &= false;
		}else{
			$('#type').html("");
		}	
							
		if($("#PosterDir").val()==""){			
			$("#tips").html("!请上传电影海报");
			flag &= false;
		}else{
			$("#tips").html("");
		}
		if(flag == true)
			$("#movie").submit();
	}
	
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
		pickerPosition: "bottom-left"
    });

    $(document).ready(function(){		                    
    		$('#datetimepicker').datetimepicker('update');
        });
</script>