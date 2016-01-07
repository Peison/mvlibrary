<div class="content">
	<div class="row">
		<div class="col-sm-6">
			<h4>电影信息</h4>
		</div>
		<div class="col-sm-6 itemNum">
			<span style="color: #1F90F1">每页条数：</span> 
			<select name="itemNum">
				<option value="8" <?php if($num == 8) echo "selected"?>>8</option>
				<option value="10" <?php if($num == 10) echo "selected"?>>10</option>
				<option value="15" <?php if($num == 15) echo "selected"?>>15</option>				
			</select>
		</div>
	</div>

	<div class="row movies">
		<div class="table-responsive col-sm-12">
			<table class="table table-striped table-bordered ">
				<thead>
					<tr>
						<th>电影名字</th>
						<th>导演</th>
						<th>主演</th>
						<th>上映时间</th>
						<th>出品国家</th>
						<th>评分</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<?php	
					$point = 0;
					foreach ($movies as $movie){
				?> 
					<tr class=<?php echo ($point%2 == 0) ? "warning" : "success"; ?>>
							<td><?php echo $movie['Title']; ?></td>
							<td><?php echo $movie['Director']; ?></td>
							<td><span><?php echo $movie['Starts']; ?></span></td>						
							<td><?php echo $movie['IssueDate']; ?></td>
							<td><?php echo $movie['Contury']; ?></td>
							<td><?php echo $movie['Rating']; ?></td>
							<td> <a href="?r=master/UpdateMovie&id=<?php echo $movie["MovieID"]?>" class="update">编辑 </a> |
								 <a href="#" id="<?php echo $movie["MovieID"]?>" class="del"> 删除</a>|
                                <a href="?r=master/vedioUpload&id=<?=$movie["MovieID"]?>">上传视频</a>
                            </td>
							<td id="Poster" style="display: none"><?php echo $movie['Poster']?></td>
					</tr>										
				<?php
					$point++;
				 }
				 ?>
				</tbody>
			</table>
		</div>
	</div>

	<div class="page">
		<?php
		$this->widget ( 'CLinkPager', array (
				'header' => '',
				'firstPageLabel' => '首页',
				'lastPageLabel' => '末页',
				'prevPageLabel' => '上一页',
				'nextPageLabel' => '下一页',
				'pages' => $page,
				'maxButtonCount' => 5,
				'cssFile' => "public/css/Page.css",
		) );
		?>
	</div>	
</div>

<script>
	$(document).ready(function(){
		$("select[name='itemNum']").change(function(){
			var num = $(this).children('option:selected').val();
			window.location.href = "?r=master/ManageMovie&itemNum="+num;
		});

		$(".del").click(function(){
			if(window.confirm("删除后数据不可回复，确定删除吗？")){
				var id = $(this).attr("id");
				var path = $("#Poster").html();		
				$.post("?r=master/DeleteMovie",{"id":id,"path":path},function(rtn){					
					if(rtn == 0){
							alert("删除失败，请联系管理员");
					}else if(rtn == 1){
						location.reload(); 
					}
				});			
			}
		});		
	});
	
</script>