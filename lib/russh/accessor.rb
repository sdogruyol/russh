require 'commander'

module Russh
  class Accessor
    def initialize
      @path = Dir.home + '/.ssh/config'
      @is_existing = is_existing?
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

    # Backups the config file to config.bk
    def backup
      FileUtils.cp @path, "#{@path}.bk"
    end

    def create(host, host_name, user)
      @host = host
      @host_name = host_name
      @user = user
      backup
      open(@path, 'a+') do |f|
        # If the file is new don't add a newline.
        f.puts if f.readlines.size > 0
        # Format each entry
        f.puts format_entry
      end
    end

    protected

    # Formats each entry
    def format_entry
      "Host #{@host}\n\tHostName #{@host_name}\n\tUser #{@user}"
    end
  end
end
