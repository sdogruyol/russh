require 'commander'
require_relative 'accessor'
require_relative 'version'

module Russh
  class Cli
    include Commander::Methods

    def run
      program :name, 'Russh'
      program :version, VERSION
      program :description, 'SSH Config Manager For Ruby'

      command :create do |c|
        c.syntax = 'russh create [options]'
        c.description = 'Creates a new host'
        c.option '--alias STRING', String, 'Host Alias'
        c.option '--host STRING', String, 'Host Address'
        c.option '--user STRING', String, 'Username'
        c.action do |args, options|
          raise ArgumentError.new("Alias is required!") unless options.alias
          raise ArgumentError.new("Host is required!") unless options.host
          Accessor.new.create options.alias, options.host, options.user
        end
      end

      command :backup do |c|
        c.syntax = 'russh backup'
        c.description = 'Backups your ssh config'
        c.action do
          Accessor.new.backup
        end
      end

      command :list do |c|
        c.syntax = 'russh list'
        c.description = 'Lists all the entries in your ssh config'
        c.action do
          Accessor.new.list
        end
      end

      run!
    end
  end
end