class KeywordMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
         t.root(path: "metadatas")
         t.language
         t.value
         t.rec_class
         t.rec_id
         t.rec_delete

  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
        xml.language
        xml.value
        xml.rec_class
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
 
  
end