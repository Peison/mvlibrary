<!DOCTYPE html>
<html>
<head>
    <?php require_once 'header.php';?>
    <link rel="stylesheet" href="/public/css/viewPassage.css">
    <link rel="stylesheet" href="/public/summernote/dist/summernote.css">
    <link rel="stylesheet" href="/public/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/public/jRating/jquery/jRating.jquery.css">
    <script src="/public/summernote/dist/summernote.min.js"></script>
    <script src="/public/jRating/jquery/jRating.jquery.js"></script>
    <title>长评论</title>
</head>
<body>
<div class="container">
    <?php require_once 'banner.php';?>
    <h3 class="view-title">
        <?=$passage['Title']?>
    </h3>
    <div class=".author-info">
        作者：<a href="?r=user/Ucenter&id=<?=$passage['UserID']?>"><?=$passage['UserName'] ?></a>
        于 <span><?= $passage['IssueDate']?></span>
    </div>
    <div class="viewPassage-mark jDisabled" data-average="<?=$passage['Mark']?>"></div>

    <div class="well viewPassage-Content">
        <?=$passage['Content']?>
        <? if($flag == 0){?>
        <div class="viewPassage-thumbs active">
            <i class="fa fa-thumbs-o-up thumbs">(<span id="up"><?=$passage['GoodTime']?></span>)</i>
            &nbsp;&nbsp;
            <i class="fa fa-thumbs-o-down thumbs">(<span id="down"><?=$passage['BadTime']?></span>)</i>
        </div>
        <?}else{?>
            <div class="viewPassage-thumbs negative">
                <i class="fa fa-thumbs-up thumbs">(<span id="up"><?=$passage['GoodTime']?></span>)</i>
                &nbsp;&nbsp;
                <i class="fa fa-thumbs-down thumbs">(<span id="down"><?=$passage['BadTime']?></span>)</i>
            </div>
        <?}?>
    </div>
    <?php require_once 'footer.php';?>
</div>

<script>
    $(function () {
        $(".viewPassage-mark").jRating({
            step:false,
            canRateAgain:false,
            nbRates:0,
            sendRequest:false,
            rateMax:10,
            decimalLength:1,
            showRateInfo:true
        });

        $(".thumbs").click(function(){
            var ele = $(this).find("span")
            var g = ele.attr("id");
            var num = ele.html();


            $.post("?r=mvlibrary/Evelate",{id:<?=$passage["PassageID"]?>,mod:g},function(rtn){
                var flag = eval( '(' + rtn + ')').Status;
                if(flag){
                    window.location.reload();
                }
            });

        });
    });

</script>
</body>
</html>