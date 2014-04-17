class IdentifierMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
     t.root(path: "metadatas")
     t.id_type
     t.value
     t.rec_class
     t.rec_id
     t.rec_delete
     t.id
         
  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |t|
    
      t.metadatas {
         t.id_type
	     t.value
	     t.rec_class
	     t.rec_id
	     t.rec_delete
	     t.id
      }
  
  
    end
    
    return builder.doc

  end
  
  
    
    
    
  
end