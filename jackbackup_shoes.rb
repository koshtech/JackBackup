require File.expand_path('../lib/jackbackup',__FILE__)

Shoes.app(:title => "JackBackup", :width => 800, :height => 600, :resizable => true) do
    stack do
        stack do
            # Gets the origin folder
            flow do
                para "Origin Folder    "
                button "..." do
                    origin_folder = ask_open_folder
                    para origin_folder
                    @origin = origin_folder + "/*"
                end
            end
            # Gets the destination folder
            flow do
                para "Destination Folder    "
                button "..." do
                    destination_folder = ask_open_folder
                    para destination_folder
                    @destination = destination_folder + "/"
                end
            end
        end
        # Getting the selected option
        stack do
            @backup_type = list_box :items => ['Copy', 'Sync']
            @backup_type.change do |t| 
                @command = t.text
                @options = ['r']
                if @command == "Sync"
                    @com = "rsync"
                    @options.push('a','z','v')
                else
                    @com = "cp"
                end
            end

        end
        stack do
           local_backup = list_box :items => ['Local','Remote']
           local_backup.change do |l|
                @back = l.text
                if @back == "Remote"
                    @backup_type.choose('Sync')
                end
           end
        end
        stack do    
            button "Make the Backup!" do
                @set_command = JackBackup.set_command(@com, @origin, @destination, @options)
                para @set_command
                JackBackup.run_command(@set_command)
            end
        end
    end
end
