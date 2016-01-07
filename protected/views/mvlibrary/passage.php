<!DOCTYPE html>
<html>
<head>
    <?php require_once 'header.php';?>
    <link rel="stylesheet" href="/public/css/Passage.css">
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

    <div class="title">
        <h3>评论<?=$movieTitle?></h3>
    </div>
    <form class="form-horizontal" role="form" method="post" action="?r=Mvlibrary/passage" class="passage-form">
        <div class="form-group">
            <label for="title" class="col-sm-1 control-label">标题：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="title" name="title" required
                       placeholder="请输入名字" value="<?=$passage['Title']?>" >
            </div>
        </div>
        <div class="form-group">
            <label for="mark" class="col-sm-1 control-label">评分：</label>
            <div class="col-sm-5" id="mark">
                    <div id="passage-mark" data-average="<?=$passage['Mark']?>">
                    </div>
                <input name="mark" type="hidden" value="<?=$passage['Mark']?>">
            </div>
        </div>
        <div class="col-sm-offset-1" id="summer-note">
            <div  id="passage-content">
            </div>
            <textarea name="content" style="display: none"><?=$passage['Content']?></textarea>
        </div>
        <div class="form-group">
            <div class="passage-submit">
                <button type="submit" class="btn btn-primary" id="passage-submit">提交</button>
            </div>
        </div>
        <input type="hidden" name="movieID" value="<?=$movieID?>">
        <input type="hidden" name="userID" value="<?=$userID?>">
    </form>
    <?php require_once 'footer.php';?>
</div>

    <script src="/public/summernote/lang/summernote-zh-CN.js"></script>
    <script type="text/javascript">
        $("#passage-content").summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            lang: 'zh-CN'
        });
        $("#passage-mark").jRating({
            step:false,
            canRateAgain:true,
            nbRates:1000,
            sendRequest:true,
            rateMax:10,
            decimalLength:1,
            showRateInfo:true,
            onClick:function(element,rate){
                $("input[name='mark']").val(rate);
            }
        });
        $("#passage-submit").click(function(){
            var html = $("#passage-content").code();
            $("textarea[name='content']").html(html);
        });

        var html = $("textarea[name='content']").html().replace(/&lt;/g,'<').replace(/&gt;/g,'>');
        $("#passage-content").code(html);
    </script>
</body>
</html>