class OrgunitMetadata < ActiveFedora::OmDatastream

   set_terminology do |t|
    t.root(path: "metadatas")
    
    t.acronym
    
    t.addresses{
      t.country
      t.geo_latitude
      t.geo_longitude
      t.locality_city_town
      t.post_code
      t.street
      
    }
    
    t.affiliation
       
    
    t.identifiers{
      t.type
      t.value
    }
    
    
    t.date_foundation
    t.date_dissolution
    t.emails
    
    
    t.name
   
    t.nationality
    
    
    t.phones{
      t.formatted
    }
    

    t.notes{
      t.language
      t.value
    }
    
    t.urls{
      t.value
    }
    
    t.rec_class
    t.rec_id


  end
  
  
  def self.xml_template
    
    Nokogiri::XML.parse("<metadatas/>")
    
  end
  

  def self.xml_form
      
      
      
      builder = Nokogiri::XML::Builder.new do |t|
        
            
            
          t.orgunit{
            
              t.name(:type=>'text', :value=>'', :label=>'Name', :display=>'public')
              
              t.rec_id(:type=>'text', :value=>'', :label=>'Identifier', :display=>'private')
              
              t.association(:name=>'addresses', :label=>'Address', :display=>'private'){
               t.properties{
               t.property(:name=>'addresses', :class_name=>'Address')
               }
              }
              
              t.association(:name=>'affiliations', :label=>'Affiliation', :display=>'private'){
                t.properties{
               t.property(:name=>'affiliations', :class_name=>'Affiliation', :display=>'public')
               }
              }
              
              t.association(:name=>'identifiers', :label=>'Identifier', :display=>'private'){
                t.properties{
                    t.property(:name=>'identifiers', :class_name=>'identifier', :display=>'public')
               }
              }
    
              
              
            
              t.emails(:type=>'text', :multiple=>'true', :label=>'Email', :display=>'private')
              
              
              t.nationality(:type=>'country', :label=>'Nationality', :display=>'private')
              t.rec_class(:type=>'hidden', :value=>'Orgunit', :display=>'public')
              
              
              t.date_foundation(:type=>'date', :label=>'Foundation date', :display=>'private')
              t.date_dissolution(:type=>'date', :label=>'Dissolution date', :display=>'private')
              t.phones(:type=>'text', :multiple=>true, :label=>'Phone', :display=>'private')
              
              t.notes(:type=>'text', :multiple=>true, :label=>'Note', :display=>'private')
              
             
                
              t.urls(:type=>'text', :multiple=>true, :label=>'Web page', :display=>'private')
              
          }
          
         
      
    
    end
    
    return builder.to_xml

  end
end