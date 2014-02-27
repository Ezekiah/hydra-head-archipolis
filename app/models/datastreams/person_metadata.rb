class PersonMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "metadatas")
    
    t.addresses{
      t.country
      t.geo_latitude
      t.geo_longitude
      t.locality_city_town
      t.post_code
      t.street
    }
    
    t.affiliations
    
    t.identifiers{
      t.type
      t.value
    }
    
    
    t.date_birth
    t.date_death
    t.emails
    
    t.gender
    t.name_family
    t.name_nick
    t.name_given
    t.name_prefix
    t.name_suffix
    t.nationality
    
    t.notes{
      t.language
      t.value
    }
    
    t.study_role
    t.study_role_description
    
    t.rec_class
    t.rec_id
    
    t.rec_permission

  end
  
  def self.xml_template
    
    Nokogiri::XML.parse("<metadatas/>")
    
  end

  def self.xml_form
    builder = Nokogiri::XML::Builder.new do |t|
     
         
         t.person{

             t.rec_id(:type=>'text', :value=>'', :label=>'Identifier', :required=>true, :display=>'private')
             
             t.association(:name=>'addresses', :label=>'Address', :display=>'private'){
              t.properties{ t.property(:name=>'addresses', :class_name=>'Address')}
              }
              
             
              
              t.association(:name=>'identifiers', :label=>'Identifier', :display=>'private'){
               t.properties{t.property(:name=>'identifiers', :class_name=>'Identifier', :display=>'private')}
              }
            
            
            t.date_birth(:type=>'date', :label=>'Birth date', :required=>true, :display=>'private')
            t.date_death(:type=>'date', :label=>'Date of death', :required=>true, :display=>'private')
            t.emails(:type=>'text', :multiple=>'true', :label=>'Email', :required=>true, :display=>'private')
            
            t.gender(:type=>'radio_buttons', :collection=>{'homme'=>'0', 'femme'=>1}, :label=>'Sex', :display=>'private')
            
            t.name_family(:type=>'text', :label=>'Family name', :display=>'public')
            t.name_nick(:type=>'text', :label=>'Surname', :display=>'private')
            t.name_given(:type=>'text', :label=>'Given name', :display=>'public')
            t.name_prefix(:type=>'text', :label=>'Particle non dropping', :display=>'private')
            t.name_suffix(:type=>'text', :label=>'Terms of address', :display=>'private')
            t.nationality(:type=>'country', :label=>'Nationality', :display=>'private')
            
            
             t.association(:name=>'affiliations', :label=>'Affiliation', :display=>'public'){
               t.properties{t.property(:name=>'affiliations', :class_name=>'Affiliation')}
              }
            
            t.phones(:type=>'text', :label=>'Phone', :display=>'private')
            
            t.rec_class(:type=>'hidden', :value=>'Person', :display=>'public')
           
            
            t.notes(:type=>'text', :multiple=>true, :label=>'Note', :display=>'private')
            
            t.study_role(:type=>'checkbox', :collection=>{'speaker'=>'speaker', 'investigator'=>'investigator', 
              'protagonist'=>'protagonist', 'depositor'=>'depositor'}, :label=>'Study role', :display=>'private')
              
            t.study_role_description(:type=>'text', :multiple=>false, :label=>'Study role description', :display=>'private')
            
        }
        
       
    
    
  end
  
  return builder.to_xml

    
    
    
    
  end
end