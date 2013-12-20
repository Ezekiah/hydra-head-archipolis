#For stocking the tree of all folders and files of the study


class FileMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
      t.root(path: "fields")
      t.name
      t.type
      t.mimetype
      
    
  end
  
  

  def self.xml_template
    
    
    builder = Nokogiri::XML::Builder.new do |xml|
    
    xml.fields
    end
    
    return builder.doc
    
  end
  
  
  
  
  
end