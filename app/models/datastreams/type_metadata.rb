class TypeMetadata < ActiveFedora::OmDatastream
   
   set_terminology do |t|
         t.root(path: "metadatas")
         t.title(index_as: :stored_searchable)
         t.rec_delete


  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
        xml.title
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
  
  
  
  
end