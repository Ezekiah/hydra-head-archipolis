
class ParseFolderToFedora
  
  def self.list_dir_content(dir='', collection='')
  

    Dir.glob(dir+'/*').each do |item|
      
      if File.directory?(item)
        
        
        #Create collection
        
        if collection != ''
        
          col = Collection.create(:name => File.basename(item), :type => 'bequali')
          
          collection.collections << col
        end
        
        list_dir_content(item, col)
        
        
      elsif File.file?(item)
        
        res = Ressource.create(:name => File.basename(item), :type => 'bequali')
        collection.ressources << res
        
        
        $count = $count + 1
        puts item
        
        
      end
      
    end
  
end
  
  
end



##IMPORT DIRECTORY STRUCT IN FEDORA

Dir.chdir('enquetes/sp3_ol')

$count = 0


study = Study.new



ParseFolderToFedora::list_dir_content('.', study)










##TEST COLLECTIONS##

#

#Create collection
#col = Collection.new(:name => "col", :type => 'bequali')

#study.collections << col

#Create subCollection

#subCollection = Collection.create(:name => "trans", :type => 'bequali')
#col.collections << subCollection




