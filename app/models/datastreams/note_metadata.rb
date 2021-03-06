class NoteMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
         t.root(path: "metadatas")
         t.language
         t.value
         t.rec_class
         t.rec_id
         t.id
         t.rec_delete

  end
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |t|
    
      t.metadatas {
         t.language
         t.value
         t.rec_class
         t.rec_id
         t.id
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
  
  
end