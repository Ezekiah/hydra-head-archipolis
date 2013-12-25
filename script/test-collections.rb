 ##IMPORT A FILE STRUCTURE IN FEDORA
 
class ParseFolderStudyToFedora
  
  #contructor
  def initialize(folder_path)
    @folder_path = folder_path
    Dir.chdir(@folder_path)
    
    @study = Study.create(:title=>File.basename(Dir.pwd))
    @base_collection = Collection.create(:name => File.basename(folder_path), :type => 'bequali', :study=>@study)
    @study.collections << @base_collection

    parse_folder('.', @base_collection)
    
  end
  
  

  #Traverse recursively the folders, there is only one level of relationship : 
  
  def parse_folder(dir, current_collection)
   
      Dir.glob(dir+'/*').each do |item|
      
      if File.directory?(item)        
        puts(item)
        #For each folder found, I create a collection object
        sub_collection = Collection.create(:name => File.basename(item), :type => 'bequali', :study=>@study)
        current_collection.collections << sub_collection
        
        #Also add the collection to the study
        #@study.collections << sub_collection
        
        #The item is a directory so we launch parse_folder on it
        parse_folder(item, sub_collection)
        
        
      elsif File.file?(item)
        puts(item)
        res = Ressource.create(:name => File.basename(item), :type => 'bequali', :study=>@study)
        current_collection.ressources << res
        #@study.ressources << res
        
      end
      
    end
    
    
  
  end
  
end







parse = ParseFolderStudyToFedora.new('enquetes/sp3_ol')

#get study



def traverse_collections(col)

  col.collections.each do |sub_col|
    
    puts sub_col.name
    
    traverse_collections
    
    
  end

end






