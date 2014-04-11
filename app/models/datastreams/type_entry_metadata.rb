class TypeEntryMetadata < ActiveFedora::OmDatastream
   
   set_terminology do |t|
         t.root(path: "metadatas")
         t.rec_id
         t.label_en
         t.label_fr
         t.value_ddi
		 t.deprecated
		 t.default
		 t.major
		
		t.value_iso639_1
		t.value_iso639_2t
		t.value_iso639_2b
		t.value_iso639_3


  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
        xml.rec_id
        xml.label_en
        xml.label_fr
        xml.value_ddi
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
  
  
  
  
end