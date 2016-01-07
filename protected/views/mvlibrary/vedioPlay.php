<html>
    <head>
        <?php require_once 'header.php';?>
        <style>
            .title{
                margin: 20px 0px;
            }
            .player{
                padding: ;
            }
        </style>
        <link href="/public/video-js/video-js.css" rel="stylesheet">
        <script src="/public/video-js/video.js"></script>
        <script>
            videojs.options.flash.swf = "video-js.swf";
            $(function(){
                myPlayer  = videojs("player");
            }) ;
        </script>
    </head>
    <body>
    <div class="vedio">
        <div class="container">
            <?php require_once 'banner.php';?>
            <div class="row">
                <div class="title">
                    <h3><?=$movie->Title?></h3>
                </div>
                <div>
                    <video id="player" class="video-js vjs-default-skin"
                           controls preload="auto"width="1080" height="492" autoplay="true"
                           data-setup='{"example_option":true}'>
                        <?=$movie->Source?>
                    </video>
                </div>
            </div>
            <?php require_once 'footer.php';?>
        </div>
    </div>
    </body>
</html>