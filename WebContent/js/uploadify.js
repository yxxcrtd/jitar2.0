if (jQuery)
	(function(jQuery) {
		jQuery.extend(jQuery.fn, {
			uploadify : function(options) {
				jQuery(this).each(function() {
					var settings = jQuery.extend( {
						id : jQuery(this).attr('id'),
						uploader : 'uploadify.swf',
						script : 'uploadify.php',
						expressInstall : null,
						folder : '',
						height : 30,
						width : 110,
						cancelImg : 'cancel.png',
						wmode : 'opaque',
						scriptAccess : 'sameDomain',
						fileDataName : 'file',
						method : 'POST',
						queueSizeLimit : 999,
						simUploadLimit : 1,
						queueID : false,
						displayData : 'percentage',
						removeCompleted : true,
						onInit : function() {},
						onSelect : function() {},
						onSelectOnce : function() {},
						onQueueFull : function() {},
						onCheck : function() {},
						onCancel : function() {},
						onClearQueue : function() {},
						onError : function() {},
						onProgress : function() {},
						onComplete : function() {},
						onAllComplete : function() {}
					}, options);
					
					jQuery(this).data('settings', settings);
					var pagePath = location.pathname;
					pagePath = pagePath.split('/');
					pagePath.pop();
					pagePath = pagePath.join('/') + '/';
					var data = {};
					data.uploadifyID = settings.id;
					data.pagepath = pagePath;
					if (settings.buttonImg)
						data.buttonImg = escape(settings.buttonImg);
					if (settings.buttonText)
						data.buttonText = escape(settings.buttonText);
					if (settings.rollover)
						data.rollover = true;
						data.script = settings.script;
						data.folder = escape(settings.folder);
					if (settings.scriptData) {
						var scriptDataString = '';
						for (var name in settings.scriptData) {
							scriptDataString += '&' + name + '=' + settings.scriptData[name];
						}
						data.scriptData = escape(scriptDataString.substr(1));
					}
					data.width = settings.width;
					data.height = settings.height;
					data.wmode = settings.wmode;
					data.method = settings.method;
					data.queueSizeLimit = settings.queueSizeLimit;
					data.simUploadLimit = settings.simUploadLimit;
					if (settings.hideButton)
						data.hideButton = true;
					if (settings.fileDesc)
						data.fileDesc = settings.fileDesc;
					if (settings.fileExt)
						data.fileExt = settings.fileExt;
					if (settings.multi)
						data.multi = true;
					if (settings.auto)
						data.auto = true;
					if (settings.sizeLimit)
						data.sizeLimit = settings.sizeLimit;
					if (settings.checkScript)
						data.checkScript = settings.checkScript;
					if (settings.fileDataName)
						data.fileDataName = settings.fileDataName;
					if (settings.queueID)
						data.queueID = settings.queueID;
					if (settings.onInit() !== false) {
						jQuery(this).css('display', 'none');
						jQuery(this).after('<div id="' + jQuery(this).attr('id') + 'Uploader"></div>');
						swfobject.embedSWF(settings.uploader, settings.id + 'Uploader', settings.width, settings.height, '9.0.24', settings.expressInstall, data, { 'quality' : 'high', 'wmode' : settings.wmode, 'allowScriptAccess' : settings.scriptAccess }, {}, function(event) {
							if (typeof (settings.onSWFReady) == 'function' && event.success)
								settings.onSWFReady();
						});
						if (settings.queueID == false) {
							jQuery("#" + jQuery(this).attr('id') + "Uploader").after('<div id="' + jQuery(this).attr('id') + 'Queue" class="uploadifyQueue"></div>');
						} else {
							jQuery("#" + settings.queueID).addClass('uploadifyQueue');
						}
					}
													
					if (typeof (settings.onOpen) == 'function') {
						jQuery(this).bind("uploadifyOpen", settings.onOpen);
					}
													
					jQuery(this).bind("uploadifySelect", { 'action' : settings.onSelect, 'queueID' : settings.queueID }, function(event, ID, fileObj) {
						if (event.data.action(event, ID, fileObj) !== false) {
							var byteSize = Math.round(fileObj.size / 1024 * 100) * .01;
							var suffix = 'KB';
							if (byteSize > 1024) {
								byteSize = Math.round(byteSize / 1024 * 1000) * .001;
								suffix = 'MB';
							}
							
							var sizeParts = byteSize.toString().split('.');
							if (sizeParts.length > 1) {
								byteSize = sizeParts[0] + '.' + sizeParts[1].substr(0, 2);
							} else {
								byteSize = sizeParts[0];
							}
							fileName = fileObj.name;
							queue = '#' + jQuery(this).attr('id') + 'Queue';
							if (event.data.queueID) {
								queue = '#' + event.data.queueID;
							}																			
							jQuery(queue).append('<div id="' + jQuery(this).attr('id') + ID + '" class="uploadifyQueueItem"><div class="cancel"><a href="javascript:jQuery(\'#' + jQuery(this).attr('id')+ '\').uploadifyCancel(\'' + ID + '\')"><img src="' + settings.cancelImg + '" border="0" /></a></div><span class="fileName">' + fileName + ' (' + byteSize + suffix + ')</span><span class="percentage"></span><div class="uploadifyProgress"><div id="' + jQuery(this).attr('id') + ID + 'ProgressBar" class="uploadifyProgressBar"></div></div></div>');
						}
					});
													
					jQuery(this).bind("uploadifySelectOnce", { 'action' : settings.onSelectOnce }, function(event, data) {
						event.data.action(event, data);
						if (settings.auto) {
							if (settings.checkScript) {
								jQuery(this).uploadifyUpload(null, false);
							} else {
								jQuery(this).uploadifyUpload(null, true);
							}
						}
					});
													
					jQuery(this).bind("uploadifyQueueFull", { 'action' : settings.onQueueFull }, function(event, queueSizeLimit) {
						if (event.data.action(event, queueSizeLimit) !== false) {
							alert('上传的队列已满，队列的最大数是：' + queueSizeLimit + '！');
						}
					});
													
					jQuery(this).bind("uploadifyCheckExist", { 'action' : settings.onCheck }, function(event, checkScript, fileQueueObj, folder, single) {
						var postData = new Object();
						postData = fileQueueObj;
						postData.folder = (folder.substr(0, 1) == '/') ? folder : pagePath + folder;
						if (single) {
							for ( var ID in fileQueueObj) {
								var singleFileID = ID;
							}
						}
																		
						jQuery.post(checkScript, postData, function(data) {
							for ( var key in data) {
								if (event.data.action(event, data, key) !== false) {
									var replaceFile = confirm("Do you want to replace the file " + data[key] + "?");
									if (!replaceFile) {
										document.getElementById(jQuery(event.target).attr('id') + 'Uploader').cancelFileUpload(key, true, true);
									}
								}
							}
							if (single) {
								document.getElementById(jQuery(event.target).attr('id') + 'Uploader').startFileUpload(singleFileID, true);
							} else {
								document.getElementById(jQuery(event.target).attr('id') + 'Uploader').startFileUpload(null, true);
							}
						}, "json");
					});

					jQuery(this).bind("uploadifyCancel", { 'action' : settings.onCancel }, function(event, ID, fileObj, data, remove, clearFast) {
						if (event.data.action(event, ID, fileObj, data, clearFast) !== false) {
							if (remove) {
								var fadeSpeed = (clearFast == true) ? 0 : 250;
								jQuery("#" + jQuery(this).attr('id') + ID).fadeOut(fadeSpeed, function() {
									jQuery(this).remove();
								});
							}
						}
					});
													
					jQuery(this).bind("uploadifyClearQueue", { 'action' : settings.onClearQueue }, function(event, clearFast) {
						var queueID = (settings.queueID) ? settings.queueID : jQuery(this).attr('id') + 'Queue';
						if (clearFast) {
							jQuery("#" + queueID).find('.uploadifyQueueItem').remove();
						}
						if (event.data.action(event, clearFast) !== false) {
							jQuery("#" + queueID).find('.uploadifyQueueItem').each(function() {
								var index = jQuery('.uploadifyQueueItem').index(this);
								jQuery(this).delay(index * 100).fadeOut(250, function() {
									jQuery(this).remove();
								});
							});
						}
					});
													
					var errorArray = [];
					jQuery(this).bind("uploadifyError", { 'action' : settings.onError }, function(event, ID, fileObj, errorObj) {
						if (event.data.action(event, ID, fileObj, errorObj) !== false) {
							var fileArray = new Array(ID, fileObj, errorObj);
							errorArray.push(fileArray);
							if ("File Size" == errorObj.type) {
								jQuery("#" + jQuery(this).attr('id') + ID + " .percentage").html("<font color='#FF0000'><strong> - 上传文件不能超过指定大小！</strong></font>");
							} else if ("HTTP" == errorObj.type) {
								jQuery("#" + jQuery(this).attr('id') + ID + " .percentage").html("<font color='#FF0000'><strong> - 后台没有上传的处理或上传路径有误！</strong></font>");
							} else if ("IO" == errorObj.type) {
								jQuery("#" + jQuery(this).attr('id') + ID + " .percentage").html("<font color='#FF0000'><strong> - 转换服务异常！</strong></font>");
							} else if ("Security" == errorObj.type) {
								jQuery("#" + jQuery(this).attr('id') + ID + " .percentage").html("<font color='#FF0000'><strong> - 安全性错误！</strong></font>");
							} else {
								jQuery("#" + jQuery(this).attr('id') + ID + " .percentage")	.html("<font color='#FF0000'><strong> - " + errorObj.type + " 错误！</strong></font>");
							}
							jQuery("#" + jQuery(this).attr('id') + ID).addClass('uploadifyError');
						};
					});
													
					if (typeof (settings.onUpload) == 'function') {
						jQuery(this).bind("uploadifyUpload", settings.onUpload);
					}
													
					jQuery(this).bind("uploadifyProgress", { 'action' : settings.onProgress, 'toDisplay' : settings.displayData }, function(event, ID, fileObj, data) {
						if (event.data.action(event, ID, fileObj, data) !== false) {
							jQuery("#" + jQuery(this).attr('id') + ID + "ProgressBar").animate({ 'width' : data.percentage + '%' }, 250, function() {
								if (data.percentage == 100) {
									jQuery(this).closest('.uploadifyProgress').fadeOut(250, function() {
										jQuery(this).remove();
									});
								}
							});
							if (event.data.toDisplay == 'percentage')
								displayData = ' - ' + data.percentage + '%  ';
							if (event.data.toDisplay == 'speed')
								displayData = ' - ' + data.speed + 'KB/s';
							if (event.data.toDisplay == null)
								displayData = ' ';
							jQuery("#" + jQuery(this).attr('id') + ID).find('.percentage').text(displayData + "处理中......");
						}
					});
													
					// 上传后的提示信息
					jQuery(this).bind("uploadifyComplete", { 'action' : settings.onComplete }, function(event, ID, fileObj, response, data) {
						if (event.data.action(event, ID, fileObj, unescape(response), data) !== false) {
							if (response == "a") {
								jQuery("#" + jQuery(this).attr('id') + ID).find('.percentage').html("<font color='#FF0000'><strong>&nbsp;&nbsp;- 达到您当日资源的上限总数！</strong></font>");
								jQuery("#" + jQuery(this).attr('id') + ID).addClass('uploadifyError');
							} else if (response == "b") {
								jQuery("#" + jQuery(this).attr('id') + ID).find('.percentage').html("<font color='#FF0000'><strong>&nbsp;&nbsp;- 您的空间已满，无法上传！</strong></font>");
								jQuery("#" + jQuery(this).attr('id') + ID).addClass('uploadifyError');
							} else if (response == "c") {
								jQuery("#" + jQuery(this).attr('id') + ID).find('.percentage').html("<font color='#FF0000'><strong>&nbsp;&nbsp;- 标题与'非法词汇'完全相同！</strong></font>");
								jQuery("#" + jQuery(this).attr('id') + ID).addClass('uploadifyError');
							} else if (response == "d") {
								jQuery("#" + jQuery(this).attr('id') + ID).find('.percentage').html("<font color='#FF0000'><strong>&nbsp;&nbsp;- 上传文件不合法！</strong></font>");
								jQuery("#" + jQuery(this).attr('id') + ID).addClass('uploadifyError');
							} else if (response == "e") {
								jQuery("#" + jQuery(this).attr('id') + ID).find('.percentage').html("<font color='#FF0000'><strong>&nbsp;&nbsp;- 不是视频文件！或不支持的视频文件！！</strong></font>");
								jQuery("#" + jQuery(this).attr('id') + ID).addClass('uploadifyError');
							}  else {
								jQuery("#" + jQuery(this).attr('id') + ID).find('.percentage').html("<font color='#00FF00'><strong>&nbsp;&nbsp;- 上传成功！</strong></font>");
								jQuery("#" + jQuery(event.target).attr('id') + ID).addClass('completed');
							}
						}
					});
													
					if (typeof (settings.onAllComplete) == 'function') {
						jQuery(this).bind("uploadifyAllComplete", { 'action' : settings.onAllComplete }, function(	event, data) {
							if (event.data.action(event, data) !== false) {
								errorArray = [];
							}
						});
					}
				});
			},
							
			uploadifySettings : function(settingName, settingValue, resetObject) {
				var returnValue = false;
				jQuery(this).each(function() {
					if (settingName == 'scriptData' && settingValue != null) {
						if (resetObject) {
							var scriptData = settingValue;
						} else {
							var scriptData = jQuery.extend(jQuery(this).data('settings').scriptData, settingValue);
						}
						var scriptDataString = '';
						for ( var name in scriptData) {
							scriptDataString += '&' + name + '=' + scriptData[name];
						}
						settingValue = escape(scriptDataString.substr(1));
					}
					returnValue = document.getElementById(jQuery(this).attr('id') + 'Uploader').updateSettings(settingName, settingValue);
				});
				if (settingValue == null) {
					if (settingName == 'scriptData') {
						var returnSplit = unescape(returnValue).split('&');
						var returnObj = new Object();
						for ( var i = 0; i < returnSplit.length; i++) {
							var iSplit = returnSplit[i].split('=');
							returnObj[iSplit[0]] = iSplit[1];
						}
						returnValue = returnObj;
					}
				}
				return returnValue;
			},
			uploadifyUpload : function(ID, checkComplete) {
				jQuery(this).each(function() {
					if (!checkComplete)
						checkComplete = false;
					document.getElementById(jQuery(this).attr('id') + 'Uploader').startFileUpload(ID, checkComplete);
				});
			},
			uploadifyCancel : function(ID) {
				jQuery(this).each(function() {
					document.getElementById(jQuery(this).attr('id') + 'Uploader').cancelFileUpload(ID, true, true, false);
				});
			},
			uploadifyClearQueue : function() {
				jQuery(this).each(function() {
					document.getElementById(jQuery(this).attr('id') + 'Uploader').clearFileUploadQueue(false);
				});
			}
		});
	})(jQuery);

	
