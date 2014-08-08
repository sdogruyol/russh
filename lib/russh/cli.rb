require 'commander'
require 'russh/accessor'

module Russh
  class Cli
    include Commander::Methods

    def run
      program :name, 'Rrush'
      program :version, '0.0.1'
      program :description, 'SSH Config Manager For Ruby'

      command :create do |c|
        c.syntax = 'russh create'
        c.description = 'Creates a new host'
        c.action do |args, options|

        end
      end
      run!
    end
  end
end

Russh::Cli.new.run if $0 == __FILE__