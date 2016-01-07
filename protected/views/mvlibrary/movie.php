<!DOCTYPE html>
<html>
<head>
		<?php require_once 'header.php';?>
        <link rel="stylesheet" type="text/css" href="/public/css/button.css">
		<link rel="stylesheet" href="/public/css/Movie.css">
        <link rel="stylesheet" href="/public/jRating/jquery/jRating.jquery.css">
        <link rel="stylesheet" href="/public/font-awesome/css/font-awesome.min.css">
        <script src="/public/jRating/jquery/jRating.jquery.js"></script>
</head>
<body class="movie">
	<div class="container">
		<?php require_once 'banner.php';?>						
		<div class="row">
			<div class="photo">
				<div class="col-md-3 col-xs-4">
					<div class="thumbnail">
						<a href="<?=$vedioLink?>"><img src="<?php echo $movie['Poster'];?>"
							alt="通用的占位符缩略图"></a>
					</div>
				</div>

				<div class="introduce">
					<div class="col-md-9 col-xs-8" id="mov_introduce">
						<div class="visible-lg">
							<h3><?php echo $movie['Title'];?></h3>
						</div>
						<div class="visible-md visible-sm visible-xs">
							<h4><?php echo $movie['Title'];?></h4>
						</div>

						<p>导演：<?php echo $movie['Director'];?></p>
						<p>编剧：<?php echo $movie['Writer'];?></p>
						<p>主演：<?php echo $movie['Starts'];?></p>
						<p>类型：<?php echo $tag;?></p>						
						<p>片长：<?php echo $movie['TimeSpan'];?></p>						
						<p>评分：<?php echo $movie['Rating'];?></p>
						<p>制品地区：<?php echo $movie['Contury'];?></p>
						<p>上映时间：<?php echo $movie['IssueDate'];?></p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="desc">
				<div style="float: left">
					<span><?php echo $movie['Title'];?> 的简介:</span>
				</div>
                <div style="clear: left"></div>
				<p style="text-indent: 2em"><?php echo $movie['MovieDesc'];?></p>
			</div>
		</div>
		
		<div class="comment">
			<div style="float: left">
				<a name="comm"></a>
				<span><?php echo $movie['Title'];?> 的短评......(共<?=count($comms)?>条)</span>
			</div>
            <div style="text-align: right">
                <span class="point" id="wrt-desc" data-target="#wrt-desc-modal" data-toggle="modal" data-backdrop="static">说两句吧</span>
            </div>
		</div>									
		<?php foreach ($comms as $comm){?>		
		<div class="row">
			<div class="col-md-2 col-xs-3 title">
				<p><a href="?r=user/Ucenter&id=<?=$comm['UserID']?>"><?php echo $comm['UserName']?></a></p>
				<p><?php echo date('Y-m-d',strtotime($comm['IssueDate']));?></p>
			</div>
			<div class="col-md-10 col-xs-9 content">
				<p>	
					<?php echo $comm['Content']?>				
				</p>				
			</div>
		</div>
		<?php }?>

        <div class="comment">
            <div style="float: left">
                <a name="comm"></a>
                <span><?php echo $movie['Title'];?> 的长评......(共<?=count($passages)?>条)</span>
            </div>
            <div style="text-align: right">
                <a class="point" href="?r=Mvlibrary/passage&movieID=<?=$movie['MovieID']?>&path=<?=$path?>">写长评</a>
            </div>
        </div>
        <? foreach($passages as $k=>$passage) {?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <?=$passage['PTitle']?> -- by <a href="?r=user/Ucenter&id=<?=$passage['UserID']?>"><?=$passage['UserName']?></a>
                    <!-- <div class="passage-mark jDisabled" data-average="<?=$passage['Mark']?>" style="float: right">
                    </div> -->
                </div>
                <div class="panel-body" style="text-overflow: clip">
                    <?=$passage['ShortCut']?>......
                    <a href="?r=mvlibrary/viewPassage&id=<?=$passage["PassageID"]?>" style="cursor: pointer">查看全部>></a>
                </div>
            </div>
        <?}?>
        <? if($login){?>
            <div class="collect" data-toggle="modal" data-target="#collect-modal" data-backdrop="static" data-keyboard="false" >
                <span>收藏</span>
            </div>
        <?}?>
        <?php require_once 'footer.php';?>

    <!-- 短评模态框（Modal） -->
    <div class="modal fade" id="wrt-desc-modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        说两句吧
                    </h4>
                </div>
                <div class="modal-body">
                    <div class = "row">
                        <div class="addDesc">
                            <form action="?r=mvlibrary/addComment" method="post">
                                <textarea name="Content"></textarea>
                                <input type="hidden" name="MovieID" value="<?php echo $movie['MovieID'];?>">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="modal-submit">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 收藏模态框（Modal） -->
    <div class="modal fade collect-modal" id="collect-modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        收藏
                    </h4>
                </div>
                <div class="modal-body collect-modal-body">
                    <form action="" method="post" id="collect-form">
                        <div class="form-group">
                            <input type="text" class="collect-input form-control" placeholder="新建影单" name="newSetName">
                            <input type="hidden" name="movieID" value="<?= $movie['MovieID'];?>">
                            <input type="hidden" name="setID" value="">
                        </div>
                    </form>
                    <h5> &nbsp;我的影单：</h5>
                    <div id="collect-set">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="collect-submit">
                        新建
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div>
    </div><!-- /.modal -->
    <div class="collect-tip">

    </div>
        <script type="text/javascript">
		$(document).ready(function(){
			var desc = $(".desc p").html();
			desc = desc.replace(/\n/g,"<br>");
			$(".desc p").html(desc);

            $(".passage-mark").jRating({
                step:false,
                canRateAgain:false,
                nbRates:0,
                sendRequest:false,
                rateMax:10,
                decimalLength:1,
                showRateInfo:true
            });

            $("#modal-submit").on("click",function(){
                $(".addDesc form").submit();
            });

            $(".passage-close").click(function (){
                $(this).toggleClass("fa-plus fa-minus");
            });

            $('#collect-modal').on('click','.set',function(){
                var setid = $(this).prop('id');
                $('input[name="setID"]').val(setid);
                $('#collect-submit').click();
            }).on('click','#collect-submit',function(){
                addMovieToSet();
            });

            $('.collect').click(function(){
                $.post('?r=mvlibrary/GetSetsofUser',{},function(rst){
                    var rst = eval('('+rst+')');
                    var $html = "";
                    for(var i = 0; i < rst.length; i++){
                        $html += '<span class="button button-block button-rounded button-normal set" id="'+ rst[i].SetID+'">'+ rst[i].SetName +'</span>'
                    }
                    $('#collect-set').html($html);
                })
            });
            
//            $('input[name="newSetName"]').keydown(function (e) {
//                if(e.keyCode == 13){
//                    addMovieToSet();
//                }
//            });

            function addMovieToSet(){
                var action = '?r=mvlibrary/collect';
                var newSetName = $("input[name='newSetName']").val();
                var movieID = $("input[name='movieID']").val();
                var setID = $("input[name='setID']").val();

                params = {newSetName:newSetName,movieID:movieID,setID:setID};
                $.post(action,params,function(rst){
                    var msg = eval( '(' + rst + ')').msg;
                    $('.collect-tip').html(msg);
                    $('.collect-tip').fadeIn(1500);
                    $('.collect-tip').fadeOut(1500);
                });
            }
		});
	</script>
</body>
</html>

