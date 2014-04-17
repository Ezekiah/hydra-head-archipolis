class SpeakerMetadata < ActiveFedora::OmDatastream

   set_terminology do |t|
         t.root(path: "metadatas")
         t.name_original
         t.name_nick
         t.rec_class
         t.rec_id
         t.role
         t.role_description

  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |t|
    
      t.metadatas {
         t.name_original
         t.name_nick
         t.rec_class
         t.rec_id
         t.role
         t.role_description
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
  
  
  
  
end