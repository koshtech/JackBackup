Shoes.app(:title => "JackBackup", :width => 800, :height => 600, :resizable => true) do
    stack do
        para "Origin Folder"
        stack do
            button "..." do
                origin_folder = ask_open_folder
        		internal_directories = []
        		Dir.entries(origin_folder).each do |d|	
    				internal_directories.push(d)
        		end
                para internal_directories
            end
        end
        para "Destination Folder"
        stack do
            button "..." do
                destination_folder = ask_open_folder
                internal_directories2 = []
                Dir.entries(destination_folder).each do |d|  
                    destination_directories.push(d)
                end
                para destination_directories
            end
        end
    end
end
