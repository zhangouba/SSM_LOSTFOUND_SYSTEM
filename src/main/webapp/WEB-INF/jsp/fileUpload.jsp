<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
 <link href="../../fileUpload/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
 <link href="../../fileUpload/themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
 <script src="../../fileUpload/js/plugins/sortable.js" type="text/javascript"></script>
 <script src="../../fileUpload/js/fileinput.js" type="text/javascript"></script>
 <script src="../../fileUpload/js/locales/zh.js" type="text/javascript"></script>
 <script src="../../fileUpload/themes/fas/theme.js" type="text/javascript"></script>
 <script src="../../fileUpload/themes/explorer-fas/theme.js" type="text/javascript"></script>
</head>
<body>
<div class="container my-4">
	<form enctype="multipart/form-data">
	        <hr>
	        <div class="form-group  form-inline">
	        	 <label class="control-label">选择图片：</label>
	        	<div class="file-loading">
					<input id="imagesFile" name="imagesFile" type="file" multiple>
				</div>
	        </div>
	        <div id="errorBlocks" class="help-block"></div>
	        <input type="hidden" name="imageUrl"/>
	</form>

</div>

<script>
    $(document).ready(function () {
    	$("#imagesFile").fileinput({
	 		theme: 'fas',
	 		language: 'zh',
	 		showCaption: false, 
	 		dropZoneEnabled: false,
	 		showUpload: false,
	 		showRemove: false,
	 		uploadUrl: '../pic/upload.action',
	 		elErrorContainer: '#errorBlocks',
	 		allowedFileExtensions: ['jpg', 'png', 'gif','jpeg','webp']
	 	}).on("filebatchselected", function(event, files) {
            $(this).fileinput("upload");
        }).on('fileerror', function(event, data) {
        			alert(data);
				}).on('fileuploaded', function(event, data) {
						console.log(data.response.url);
						$("input[name='imageUrl']").val(data.response.url);
						alert($("input[name='imageUrl']").val());
         			});

    });
</script>
</body>

</html>
