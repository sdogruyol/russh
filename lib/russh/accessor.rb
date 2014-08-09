require 'commander'

module Russh
  class Accessor
    attr_reader :path

    def initialize
      @path = Dir.home + '/.ssh/config'
      @is_existing = is_existing?
      @is_readable = is_readable?
      @is_writable = is_writable?
    end

    # Checks if the config file is existing. If not it creates a new one.
    def is_existing?
      if File.exist? @path
        @is_existing = true
      else
        puts "You don't have an existing ssh config file. Creating a new one for you."
        File.new(@path, 'w')
      end
    end

    # Checks if the config file is readable.
    def is_readable?
      begin
        @is_readable = File.readable? @path
      rescue => e
        puts "Couldn't be able to read your ssh config: Error #{e}"
      end
    end

    # Checks if the config file is writable.
    def is_writable?
      begin
        @is_writable = File.writable? @path
      rescue => e
        puts "Couldn't be able to write your ssh config: Error #{e}"
      end
    end

    # Backups the config file to config.bk
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

    def create(host, host_name, user)
      # Ask the user for input
      @host = host
      @host_name = host_name
      @user = user
      # Check for read and write access
      if is_readable? && is_writable?
        backup
        open(@path, 'a+') do |f|
          # If the file is new don't add a newline.
          f.puts if f.readlines.size > 0
          # Format each entry
          f.puts format_entry
        end
      end
    end

    protected

    # Formats each entry
    def format_entry
      "Host #{@host}\n\tHostName #{@host_name}\n\tUser #{@user}"
    end
  end
end
