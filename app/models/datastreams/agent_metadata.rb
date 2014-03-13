class AgentMetadata < ActiveFedora::OmDatastream

   set_terminology do |t|
    t.root(path: "metadatas")
    
    
    t.orgunits
    t.persons
    t.rec_id
    t.rec_class
    


  end
  
  
  def self.xml_template
    
    Nokogiri::XML.parse("<metadatas/>")
    
  end
  

  
end