<!DOCTYPE html>
<html>
<head>
    <?php require_once dirname(__FILE__).'/../mvlibrary/header.php';?>
    <link rel="stylesheet" href="/public/css/Ucenter.css">
    <link rel="stylesheet" href="/public/font-awesome/css/font-awesome.min.css">
</head>
<body>
<div class="container">
    <?php require_once dirname(__FILE__).'/../mvlibrary/banner.php';?>
    <div class="uc-title">
        <h3><?=$user['UserName']?>的电影</h3>
    </div>

    <div class="row set-list">
        <div class="little-title">ta 创建的影单...</div>
        <?foreach($set as $item){?>
        <div class="col-md-2 col-xs-3">
            <div class="thumbnail mv-img">
                <a href="?r=user/setDetail&id=<?= $item['SetID']?>">
                    <img src="<?= $item['Photo'];?>" title="<?= $item['SetName'];?>" style="vertical-align: middle;"></a>
                <?if($self){?>
                    <span class='trash my-set'><i class="fa fa-trash-o fa-2x" title='删除' id="<?=$item['SetID']?>"></i></span>
                <?}?>
            </div>
            <div class="desc">
                <a href="?r=user/setDetail&id=<?=$item['SetID']?>"><?= $item['SetName']?>(<?= $setCount[$item['SetID']]?>部)</a>
            </div>
        </div>
        <?}?>
    </div>
    <br>
    <br>
    <div class="row set-list">
        <div class="little-title">ta 收藏的影单...</div>
        <?foreach($collect as $item){?>
            <div class="col-md-2 col-xs-3">
                <div class="thumbnail mv-img">
                    <a href="?r=user/setDetail&id=<?= $item['SetID']?>">
                        <img src="<?= $item['Photo'];?>" title="<?= $item['SetName'];?>" style="vertical-align: middle;"></a>
                    <?if($self){?>
                        <span class='trash my-collect'><i class="fa fa-trash-o fa-2x" title='删除' id="<?= $item['SetID']?>"></i></span>
                    <?}?>
                </div>
                <div class="desc">
                    <a href="?r=user/setDetail&id=<?= $item['SetID']?>"><?= $item['SetName']?>(<?= $setCount[$item['SetID']]?>部)</a>
                </div>
            </div>
        <?}?>
    </div>
    <br>
    <br>
    <div class="row passage-list">
        <div class="little-title">ta 写的长评...</div>
        <? foreach($passages as $k=>$passage) {?>
            <div class="panel panel-default passage">
                <div class="panel-heading">
                    <?=$passage['Title']?>
                    <!-- <div class="passage-mark jDisabled" data-average="<?=$passage['Mark']?>" style="float: right">
                    </div> -->
                </div>
                <div class="panel-body" style="text-overflow: clip">
                    <?=$passage['ShortCut']?>......
                    <a href="?r=mvlibrary/viewPassage&id=<?=$passage["PassageID"]?>" style="cursor: pointer">查看全部>></a>
                </div>
            </div>
        <?}?>
    </div>
    <?php require_once dirname(__FILE__).'/../mvlibrary/footer.php';?>
</div>
</body>
</html>
<script>
    $(function(){
        $('.mv-img').mouseenter(function(){
            $(this).find('.trash').show();
        }).mouseleave(function(){
            $('.trash').hide();
        })

        $('.my-set').click(function(){
            $setid = $(this).find('i').prop('id');
            $action = "?r=mvlibrary/DeleteSet";

            $.post($action,{setID:$setid},function(){
                window.location.reload();
            });
        });

        $('.my-collect').click(function(){
            $setid = $(this).find('i').prop('id');
            $action = "?r=mvlibrary/DeleteCollect";

            $.post($action,{setID:$setid},function(){
                window.location.reload();
            });
        });
    })
</script>

