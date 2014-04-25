#For stocking the tree of all folders and files of the study


class TreeMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
      t.root(path: "tree")
      
    
  end
  
  

  def self.xml_template
    
    
    builder = Nokogiri::XML::Builder.new do |xml|
    
    xml.tree
    end
    
    return builder.doc
    
  end
  
  
  
  
  
end
