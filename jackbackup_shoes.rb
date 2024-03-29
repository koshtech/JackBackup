require File.expand_path('../lib/jackbackup',__FILE__)

Shoes.app(:title => "JackBackup", :width => 800, :height => 600, :resizable => true) do
    stack do
        # Gets the origin folder
        flow do
            para "Origin Folder    "
            button "..." do
                origin_folder = ask_open_folder
                @origin = origin_folder + "/*"
            end
            para @origin
        end
        # Gets the destination folder
        flow do
            para "Destination Folder    "
            button "..." do
                destination_folder = ask_open_folder
                @destination = destination_folder + "/"
            end
            para @destination
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
                @s.append( edit_line )
            else
                @s.clear
            end
        end
        @s = flow do
            edit_line
        end
        @s.clear
    end
    stack do    
        button "Make the Backup!" do
            @set_command = JackBackup.set_command(@com, @origin, @destination, @options)
            para @set_command
            JackBackup.run_command(@set_command)
        end
    end
end
