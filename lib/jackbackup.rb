require 'rubygems'
require 'open3'

class JackBackup
    def self.set_command(command, source, destination, options='')
        if options != ''
            depured_options = options.map{|i| i.to_s}.join("")
        else
            depured_options = ""
        end
        command = "#{command} -#{depured_options} #{source} #{destination}"
        return command
    end

    def self.run_command(command)
        Open3::popen3("#{command}") { |stdin, stdout, sterr|
            @out = stdout.read.strip
            @err = sterr.read.strip
        }
        return @out, @err
    end
end
