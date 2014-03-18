class ProjectMetadata < ActiveFedora::OmDatastream

   set_terminology do |t|
    t.root(path: "metadatas")
    t.acronym
    t.title
    t.descriptions
    t.identifiers
    t.awards
    t.rec_class
    t.date_begin
    t.date_end
    t.funding_agent_names
    t.rec_id
    t.rec_delete


  end
  
  

  def self.xml_template
      Nokogiri::XML.parse("<metadatas/>")
  end
  
  
  
  
  
end