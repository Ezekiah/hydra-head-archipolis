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
        t.metadatas{
      
          t.rec_id(:type=>'text', :value=>'', :label=>'Identifier')
          
          t.association(:name=>'addresses', :label=>'Address'){
           t.properties{
           t.property(:name=>'addresses', :class_name=>'Address')
           }
          }
          
          t.association(:name=>'affiliations', :label=>'Affiliation'){
            t.properties{
           t.property(:name=>'affiliations', :class_name=>'Affiliation')
           }
          }
          
          t.association(:name=>'identifiers', :label=>'Identifier'){
            t.properties{
                t.property(:name=>'identifiers', :class_name=>'identifier')
           }
          }

          
          
        
          t.emails(:type=>'text', :multiple=>'true', :label=>'Email')
          
          
          t.nationality(:type=>'country', :label=>'Nationality')
          t.rec_class(:type=>'hidden', :value=>'Person')
          
          
          t.date_foundation(:type=>'date', :label=>'Foundation date')
          t.date_dissolution(:type=>'date', :label=>'Dissolution date')
          t.phones(:type=>'text', :multiple=>true, :label=>'Phone')
          
          t.notes(:type=>'text', :multiple=>true, :label=>'Note')
          
         
            
          t.urls(:type=>'text', :multiple=>true, :label=>'Web page')
          
            
          
         
      }
    
    end
    
    return builder.to_xml

  end
end