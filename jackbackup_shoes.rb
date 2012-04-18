Shoes.app(:title => "JackBackup", :width => 800, :height => 600, :resizable => true) do
    stack do
        # Gets the origin folder
        para "Origin Folder"
        stack do
            button "..." do
                origin_folder = ask_open_folder
                para origin_folder
            end
        end
        # Gets the destination folder
        para "Destination Folder"
        stack do
            button "..." do
                destination_folder = ask_open_folder
                para destination_folder
            end
        end
        # Getting the selected option
        stack do
            teste = list_box :items => ['Copy', 'Sync']
            teste.change {|t| para t.text }
        end
    end
end
