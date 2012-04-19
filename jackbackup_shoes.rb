require File.expand_path('../lib/jackbackup',__FILE__)

Shoes.app(:title => "JackBackup", :width => 800, :height => 600, :resizable => true) do
    stack do
        # Gets the origin folder
        para "Origin Folder"
        stack do
            button "..." do
                origin_folder = ask_open_folder
                para origin_folder
                @origin = origin_folder
            end
        end
        # Gets the destination folder
        para "Destination Folder"
        stack do
            button "..." do
                destination_folder = ask_open_folder
                para destination_folder
                @destination = destination_folder
            end
        end
        # Getting the selected option
        stack do
            @backup_type = list_box :items => ['Copy', 'Sync']
            @backup_type.change do |t| 
                @command = t.text 
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
    if @command == "Sync"
        @com = "rsync"
    else
        @com = "cp"
    end
    @options = ['r']
    
    @b1 = button "OK!"
    @b1.click{JackBackup.set_command(@com, @origin, @destination, @options)}
    end
end
