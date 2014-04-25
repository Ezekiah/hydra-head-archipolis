class AgentMetadata < ActiveFedora::OmDatastream

   set_terminology do |t|
    t.root(path: "metadatas")
    
    t.id
    t.orgunits
    t.persons
    t.rec_id
    t.rec_class
    t.rec_delete
    


  end
  
  
  def self.xml_template
    
    Nokogiri::XML.parse("<metadatas/>")
    
  end
  

  
end