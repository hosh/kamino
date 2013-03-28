require 'thor'

module Kamino
  class CLI < Thor
    include Thor::Actions

    def self.source_paths
      File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'templates'))
    end
  end
end
