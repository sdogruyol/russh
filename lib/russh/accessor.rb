require 'commander'

module Russh
  class Accessor
    attr_reader :path

    def initialize
      @path = Dir.home + '/.ssh/config'
      @is_readable = File.readable? @path
      @is_writable = File.writable? @path
    end

    def is_readable?
      @is_readable
    end

    def is_writable?
      @is_writable
    end

    def backup
      if is_readable?
        FileUtils.cp @path, "#{@path}.bk"
      end
    end

    def read
      if is_readable?
        File.read @path
      end
    end

    def create
      @host = ask 'Host'
      @host_name = ask 'HostName'
      @user = ask 'User'
    end
  end
end
