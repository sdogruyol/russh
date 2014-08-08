module Russh
  class Reader
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

  end
end
