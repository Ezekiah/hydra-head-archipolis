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


  end
  
  

  def self.xml_template
      Nokogiri::XML.parse("<metadatas/>")
  end
  
  def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
    
  
       
          t.project{
              
              t.acronym(:type=>'text', :value=>'', :label=>'Acronym', :display=>'public')
              
              
              t.title(:type=>'text', :value=>'', :label=>'Identifier', :required=>true, :display=>'public')
              
              
              t.association(:name=>'awards', :label=>'awards', :required=>false, :display=>'private'){
                 t.properties{
                    t.property(:name=>'awards', :class_name=>'Award')
                  }          
              }
              
              t.association(:name=>'descriptions', :label=>'descriptions', :required=>true, :display=>'private'){
                 t.properties{
                    t.property(:name=>'descriptions', :class_name=>'Description')
                  }          
              }
              
              t.association(:name=>'identifiers', :label=>'identifiers', :required=>true, :display=>'public'){
                 t.properties{
                    t.property(:name=>'identifiers', :class_name=>'Identifier')
                  }          
              }
              
              t.association(:name=>'funding_agent_names', :label=>'Funding agent names', :required=>true, :display=>'public'){
                 t.properties{
                    t.property(:name=>'funding_agent_names', :class_name=>'Orgunit')
                  }          
              }
              
    
              t.rec_class(:type=>'hidden', :value=>'Project')
              
              t.date_begin(:type=>'date', :format=>'dd/mm/yyyy', :viewMode=> "days", :minViewMode=> "days", :required=>true, :display=>'private')
              t.date_end(:type=>'date', :format=>'dd/mm/yyyy', :viewMode=> "days", :minViewMode=> "days", :required=>true, :display=>'private')
              

           }
       
    end
    
    return builder.doc
    
  end
  
  
  
end