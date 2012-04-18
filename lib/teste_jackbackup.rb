require 'rubygems'
require File.expand_path('../jackbackup',__FILE__)

# command = JackBackup.set_command('cp', '/home/anna/dev/sandbox/*', '/home/anna/dev/sandbox2/', ['r'])
command = JackBackup.set_command('rsync', '/home/anna/dev/sandbox/', '/home/anna/dev/sandbox2/', ['a','z','v'])
print command
print
out, err = JackBackup.run_command(command)
print out
print err
