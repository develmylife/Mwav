(function($) {
	// UPLOAD CLASS DEFINITION
	// ======================
	var dropZone;
	var uploadForm;

	$(document).ready(function() {
		dropZone = document.getElementById('drop-zone');
		uploadForm = document.getElementById('js-upload-form');
		uploadFiles = document.getElementById('js-upload-files');

		eventBind();
	});
	
	//ImagePreview
	$(document).on('click', '#close-preview', function() {
		$('.image-preview').popover('hide');
		// Hover befor close the preview
		$('.image-preview').hover(function() {
			$('.image-preview').popover('show');
		}, function() {
			$('.image-preview').popover('hide');
		});
	});


	var eventBind = function() {
		uploadForm.addEventListener("submit", function(e) {
			e.preventDefault();
			tempUpload(uploadFiles.files);
		});

		dropZone.ondrop = function(e) {
			e.preventDefault();
			this.className = 'upload-drop-zone';
			tempUpload(e.dataTransfer.files);
		}

		dropZone.ondragover = function() {
			this.className = 'upload-drop-zone drop';
			return false;
		}

		dropZone.ondragleave = function() {
			this.className = 'upload-drop-zone';
			return false;
		}
	}

	var tempUpload = function(files) {
		console.log(files);
		tempFileUpload(files);
		setSuccessBar(files);
	}

	var setSuccessBar = function(files) {
		var success_tag = "";
		for (var i = 0; i < files.length; i++) {
			success_tag += "<a href='#' class='list-group-item list-group-item-success'><span class='badge alert-success pull-right'>Success</span>"
					+ files[i].name + "</a>";
		}

		if (success_tag != null) {
			$("#upload-finish-file").append(success_tag);
		}
	}

	function tempFileUpload(files) {
		if (files == null || files.length == 0) {
			alert('파일이 없습니다.');
			return;
		}

		var fd = new FormData();
		fd.append(files[0].name, files[0]);

		$.ajax({
			type : "POST",
			url : "/FileTestSample/TempUpload.mwav", //Upload URL
			data : fd,
			contentType : false,
			processData : false,
			cache : false,
			success : function(data) {
				if (data) {
					alert('업로드 성공');
				} else {
					alert('업로드 실패');
				}
			}
		});

	}

})(jQuery);


$(function() {
	// Create the close button
	var closebtn = $('<button/>', {
		type : "button",
		text : 'x',
		id : 'close-preview',
		style : 'font-size: initial;',
	});
	closebtn.attr("class", "close pull-right");
	// Set the popover default content
	$('.image-preview').popover({
		trigger : 'manual',
		html : true,
		title : "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
		content : "There's no image",
		placement : 'bottom'
	});
	// Clear event  콤마로 다중 사용 가능 or 조건
	$('.image-preview-clear, .fileclear').click(function() {
		$('.image-preview').attr("data-content", "").popover('hide');
		$('.image-preview-filename').val("");
		$('.image-preview-clear').hide();
		$('.image-preview-input input:file').val("");
		$(".image-preview-input-title").text("Browse");
		$("#messages").hide(); // browse 누를때는 show
	});

	// Create the preview image
	$(".image-preview-input input:file").change(
			function() {
				var img = $('<img/>', {
					id : 'dynamic',
					width : 250,
					height : 200
				});
				var file = this.files[0];
				var reader = new FileReader();
				// Set preview image into the popover data-content
				reader.onload = function(e) {
					$(".image-preview-input-title").text("Change");
					$(".image-preview-clear").show();
					$(".image-preview-filename").val(file.name);
					img.attr('src', e.target.result);
					$(".image-preview").attr("data-content",
							$(img)[0].outerHTML).popover("show");
				}
				reader.readAsDataURL(file);
			});
});