//ueditor custom config
(function () {
    window.CUSTOM_CONFIG = {
      // Insert your config code, more details on http://fex.baidu.com/ueditor/#start-config
      elementPathEnabled: false,
      wordCount:0,
      maximumWords:5000,
      pasteplain:true,
      initialFrameHeight:300,
      autoHeightEnabled: true,
      imageFieldName: 'upfile',
      autoFloatEnabled: false,
      // toolbars: [
      //      ['Source','Undo','Redo','Cleardoc','SearchReplace','InsertImage','WordImage','Bold','ForeColor','JustifyLeft',
      //      'JustifyCenter','JustifyRight','JustifyJustify','RemoveFormat','FormatMatch','AutoTypeSet','PastePlain',
      //      'FontSize','Preview','Link','FullScreen', 'PageBreak', 'InsertTable','Attachment','InsertVideo']
      // ]
    };
    jQuery.extend(window.UEDITOR_CONFIG, window.CUSTOM_CONFIG);
})();

UE.Editor.prototype.getActionUrl = function(action) {
    if (action == 'uploadimage' || action == 'uploadscrawl') {
        return '/ueditor_images';
    } else if (action == 'uploadvideo') {
        return '/ueditor_videos';
    } else {
        return this._bkGetActionUrl.call(this, action);
    }
}
