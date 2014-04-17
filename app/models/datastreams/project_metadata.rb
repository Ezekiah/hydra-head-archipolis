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
    t.id


  end
  
  

 def self.xml_template
      builder = Nokogiri::XML::Builder.new do |t|
    
      t.metadatas {
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
	    t.id
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
  
  
  
end