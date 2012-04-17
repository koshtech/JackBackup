require 'rubygems'
require 'open3'

class JackBackup
    def set_command(command, source, destination, options)
        depured_options = options.map{|i| i.to_s}.join("  ")
        rsync_command = "#{command} #{depured_options} #{source} #{destination}"
        return rsync_command
    end

    def run_command(command)
        Open3::popen3("#{command}") { |stdin, stdout, sterr|
            out = stdout.read.strip
        }
        return out
    end
end
