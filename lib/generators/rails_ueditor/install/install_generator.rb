require 'rails/generators'

module RailsUeditor
  class InstallGenerator < ::Rails::Generators::Base
    class_option :use, type: :string, default: 'assets'

    source_root File.expand_path('templates', __dir__)
    desc 'This generator installs ueditor custom config'

    def add_custom_config
      if options['use'] == 'assets'
        if File.exist?('app/assets/javascripts/ueditor_custom_config.js')
          # js = File.read('app/assets/javascripts/ueditor_custom_config.js')
          # insert_into_file 'app/assets/javascripts/ueditor_custom_config.js', js, after: "ueditor custom config\n"
          puts 'ueditor_custom_config.js has alreay in app/assets/javascripts/'
        else
          copy_file 'ueditor_custom_config.js', 'app/assets/javascripts/ueditor_custom_config.js'
        end
      else
        if File.exist?('app/javascript/packs/ueditor_custom_config.js')
          puts 'ueditor_custom_config.js has alreay in app/javascript/packs/'
        else
          copy_file 'ueditor_custom_config.js', 'app/javascript/packs/ueditor_custom_config.js'
        end
      end
    end
  end
end
