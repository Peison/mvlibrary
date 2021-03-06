<!DOCTYPE html>
<html>
<head>
    <?php require_once dirname(__FILE__).'/../mvlibrary/header.php';?>
    <link rel="stylesheet" href="/public/css/SetDetail.css">
    <link rel="stylesheet" href="/public/font-awesome/css/font-awesome.min.css">
</head>
<body>
<div class="container">
    <?php require_once dirname(__FILE__).'/../mvlibrary/banner.php';?>
    <div class="row set-info">
        <div class="col-md-2 col-xs-3 set-photo">
            <div class="thumbnail">
                <img src="<?= $set['Photo'];?>" title="<?= $set['SetName'];?>" style="vertical-align: middle;">
            </div>
        </div>
        <div class="col-md-10 col-xs-3 other-info">
            <div>
                <i class="fa fa-send  fa-rotate-90  set-title-icon"></i>
                <span class="set-title">影单:<?=$set['SetName']?></span>
            </div>
            <br>
            <div>
                <i class="fa fa-send  fa-rotate-90  set-title-icon"></i>
                <span class="set-detail"><?=$set['UserName']?> 创建于 <?=$set['CreatTime']?></span>
            </div>
            <div>
                <i class="fa fa-send  fa-rotate-90  set-title-icon"></i>
                <span class="set-detail">包含 <?=$count?> 部影片</span>
            </div>
            <div>
                <?if($self == true || $nologin == true){?>
                    <button class="btn btn-danger collect-btn disabled">收藏</button>
                <?}else{?>
                    <button class="btn btn-danger collect-btn">收藏</button>
                <?}?>
            </div>
        </div>
    </div>
    <div class="row set-list">
        <div class="little-title">影片列表：</div>
        <table>
            <?foreach($movies as $item){?>
            <tr>
                <?foreach($item as $v){?>
                <td>
                    <div class="col-md-12 col-xs-2 set-list-item">
                        <div class="thumbnail mv-img">
                            <img src="<?= $v['Poster'];?>" title="<?= $v['Title'];?>" style="vertical-align: middle;">
                            <?if($self){?>
                                <span class='trash'><i class="fa fa-trash-o fa-3x" title='删除' id="<?= $v['MovieID'];?>"></i></span>
                            <?}?>
                        </div>
                        <div class="desc">
                            <a href="?r=Mvlibrary/movie&id=<?= $v['MovieID'];?>"><?=$v['Title'];?></a>
                        </div>
                    </div>
                </td>
                <?}?>
            </tr>
            <?}?>
        </table>
    </div>
    <?php require_once dirname(__FILE__).'/../mvlibrary/footer.php';?>
</div>
<div class="collect-tip">

</div>
</body>
<script>
    $(function(){
        $('.collect-btn').click(function(){
            var setID = <?=$set['SetID']?>;
            $.post('?r=user/UserCollect',{setID:setID},function(msg){
                $('.collect-tip').html(msg);
                $('.collect-tip').fadeIn(1500);
                $('.collect-tip').fadeOut(1000);
            });
        });

        $('i').click(function(){
            $.post();
        });

        $('.mv-img').mouseenter(function(){
                $(this).find('.trash').show();
            }).mouseleave(function(){
                $('.trash').hide();
            })
        $('.trash').click(function(){
            $movieid = $(this).find('i').prop('id');
            $setid = '<?=$set['SetID']?>';
            $action = "?r=mvlibrary/DeleteSetMovie";

            $.post($action,{movieID:$movieid,setID:$setid},function(){
                window.location.reload();
            });

        });
    })
</script>
</html>

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            