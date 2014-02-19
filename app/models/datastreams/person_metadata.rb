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
      t.metadatas{
         
          t.rec_id(:type=>'text', :value=>'', :label=>'Identifier')
         
         t.association(:name=>'addresses', :label=>'Address'){
          t.properties{ t.property(:name=>'addresses', :class_name=>'Address')}
          }
          
          t.association(:name=>'affiliations', :label=>'Affiliation'){
           t.properties{t.property(:name=>'affiliations', :class_name=>'Affiliation')}
          }
          
          t.association(:name=>'identifiers', :label=>'Identifier'){
           t.properties{t.property(:name=>'identifiers', :class_name=>'Identifier')}
          }
        
        
        t.date_birth(:type=>'date', :label=>'Birth date')
        t.date_death(:type=>'date', :label=>'Date of death')
        t.emails(:type=>'text', :multiple=>'true', :label=>'Email')
        
        t.gender(:type=>'radio_buttons', :collection=>{'homme'=>'0', 'femme'=>1}, :label=>'Sex')
        
        t.name_family(:type=>'text', :label=>'Family name')
        t.name_nick(:type=>'text', :label=>'Surname')
        t.name_given(:type=>'text', :label=>'Given name')
        t.name_prefix(:type=>'text', :label=>'Particle non dropping')
        t.name_suffix(:type=>'text', :label=>'Terms of address')
        t.nationality(:type=>'country', :label=>'Nationality')
        
        t.phones(:type=>'text', :label=>'Phone')
        
        t.rec_class(:type=>'hidden', :value=>'Person')
       
        
        t.notes(:type=>'text', :multiple=>true, :label=>'Note')
        
        t.study_role(:type=>'checkbox', :collection=>{'speaker'=>'speaker', 'investigator'=>'investigator', 
          'protagonist'=>'protagonist', 'depositor'=>'depositor'}, :label=>'Study role')
          
        t.study_role_description(:type=>'text', :multiple=>false, :label=>'Study role description')
        
       
    }
    
  end
  
  return builder.to_xml

    
    
    
    
  end
end