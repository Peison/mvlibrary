<link rel="stylesheet" href="/public/bootstrap-fileinput/css/fileinput.css">
<script src="/public/bootstrap-fileinput/js/fileinput.js"></script>
<style>
   .file-drop-zone{
       height: 50%;
   }
    .file-drop-zone-title{
        padding: 5%;
    }
</style>
<div class="content">
    <div class="video-upload">
        <input id="input-id" type="file"  data-preview-file-type="text"  multiple="true" >
    </div>
    <div class="tip">
        <span class="success-tip"></span>
    </div>
</div>
<script>
    var timeOutID,intervalID;
    $("#input-id").fileinput({
        showCaption:true,
        showCancel:false,
        minFileCount:0,
        maxFileCount:10,
        allowedFileExtensions:['m4v','mp4','ogv','webm'],
        msgInvalidFileExtension:'"{name}" 视频格式错误.  现在只支持上传"{extensions}".',
        uploadLabel:'上传',
        browseLabel:'选择文件',
        removeLabel:'删除',
        dropZoneTitle:'把视频文件拖到这~',
        uploadUrl:'?r=master/AjaxUpload',
        uploadExtraData:{id:<?=$movieID?>},
        uploadAsync:true,
        previewSettings:{
            image: {width: "auto", height: "160px"},
            html: {width: "213px", height: "160px"},
            text: {width: "160px", height: "160px"},
            video: {width: "213px", height: "160px"},
            audio: {width: "213px", height: "80px"},
            flash: {width: "213px", height: "160px"},
            object: {width: "323px", height: "213px"},
            other: {width: "160px", height: "160px"}
        }
    }).on('fileuploaded', function(event, file, previewId, index, reader) {
        i = 10;
        intervalID = setInterval(function(){
            if(i>0){
                $(".file-drop-zone-title").html("上传成功，"+i+"即将跳转会电影管理页面");
                i--;
            }else{
                window.location.href="?r=master/ManageMovie"
            }
        },1500);
        $('#input-id').fileinput('clear');
    }).on('filebrowse', function(event) {
        if(window.clearInterval(intervalID)){
            $('#input-id').fileinput('clear');
        }

    });
</script>