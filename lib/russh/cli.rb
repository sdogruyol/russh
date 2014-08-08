require 'commander'
require_relative 'accessor'
require_relative 'version'

module Russh
  class Cli
    include Commander::Methods

    def run
      program :name, 'Rrush'
      program :version, VERSION
      program :description, 'SSH Config Manager For Ruby'

      command :create do |c|
        c.syntax = 'russh create'
        c.description = 'Creates a new host'
        c.action do |args, options|
          Accessor.new.create
        end
      end
      run!
    end
  end
end