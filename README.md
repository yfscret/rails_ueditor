# Rails wrapper for ueditor

a rich text editor based on baidu ueditor

  [1]: https://github.com/notadd/neditor

## Neditor Version
2.1.18

## Installation

Add this line to your application's Gemfile:

    gem 'rails_ueditor'

And then execute:

    $ bundle install


## Generating custom config js

Usage:

    rails g rails_ueditor:install


Then add codes in application.js

```javascript
//= require ueditor
//= require ueditor_custom_config
```

## Custom config

You can custom config in ueditor_custom_config.js, it looks like:

```javascript
//neditor custom config
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
```

## Routes

```ruby
    resources :ueditor_images, only: [:create]
```

## Upload File

```ruby
class **UeditorImagesController** < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def create
    @ueditor_image = UeditorImage.new(image: params[:upfile])
    respond_to do |format|
      if @ueditor_image.save
        data = {:url=> @ueditor_image.image.url, :title => params[:title], :original => params[:upfile].original_filename, :code => 200}
      else
        data = {:title => params[:title], :original => params[:upfile].original_filename, :code => 500}
      end
      format.js {render :json => data.to_json}
    end
  end
end
```

## Views

```javascript
<script type="text/javascript">
  var editor = new UE.ui.Editor();
  editor.render("your_textarea_id");
</script>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
