require 'thor'
require 'kamino/config'

module Kamino
  class CLI < Thor
    include Thor::Actions

    def self.source_paths
      [ File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'templates')) ]
    end

    desc 'rails', "Makes your Rails app cloneable"
    def rails
      say "Setting VM to hostname #{Kamino.config.default_app_name} #{Kamino.config.default_host_ip}", :yellow
      target = Dir.pwd
      template File.join('rails', 'Berksfile.erb'), File.join(target, 'Berksfile')
      template File.join('rails', 'Vagrantfile.erb'), File.join(target, 'Vagrantfile'), Kamino.config.options
      append_file(File.join(target, 'Gemfile')) { <<END }

# Berkshelf manages your cookbooks like bundler
# Define your OS dependencies in Berksfile
group :kamino do
  gem 'berkshelf'
end
END

      append_file(File.join(target, '.gitignore')) { <<END }
.vagrant
.vagrant.*
END

      empty_directory File.join(target, 'vendor', 'cookbooks')
      create_file     File.join(target, 'vendor', 'cookbooks', '.keep'), ''

    end
  end
end
