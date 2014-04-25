class AffiliationMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
         t.root(path: "metadatas")
         t.name
         t.acronym
         t.role
         t.rec_class
         t.rec_delete
         
  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
         xml.name
         xml.acronym
         xml.rec_id
         xml.role
         xml.rec_class
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
  
  
end