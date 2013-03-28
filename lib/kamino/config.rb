require 'rlet'
require 'yaml'

module Kamino
  # Right now in the interest of time, I am not separating out the
  # Rails-specific stuff. Probably the best way is having a kamino/rails
  # directory and  making this Kamino::Rails::Config
  #
  # Originally, this was intended as a way to dynamically fill in
  # Vagrantfile. However, Vagrant 1.1 onward is its own self-contained
  # tool with its own embedded Ruby and gems. We'd have to make a plugin.
  # That might be the way moving forward, but for the purpose of this
  # initial demo, we're going to use this to generate static config.

  class Config
    include Let

    let(:default_app_name)  { File.basename(Dir.pwd) }
    let(:default_host_ip)   { "33.33.33.#{rand(252) + 2}" }

    let(:development_name)  { database_config['development']['database'] }
    let(:test_name)         { database_config['test']['database'] }
    let(:username)          { database_config['development']['username'] }
    let(:password)          { database_config['development']['password'] }

    let(:database_config)   { YAML.load_file database_yml_file }

    let(:database_yml_file) { File.join config_dir, 'database.yml' }
    let(:config_dir)        { File.join Dir.pwd, 'config' }

    let(:options) do
      {
        :app_name         => default_app_name,
        :host_ip          => default_host_ip,
        :development_name => development_name,
        :test_name        => test_name,
        :username         => username,
        :password         => password
      }
    end
  end

  def self.config
    @config ||= Kamino::Config.new
  end
end
