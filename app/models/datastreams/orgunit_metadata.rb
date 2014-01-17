class OrgunitMetadata < ActiveFedora::OmDatastream

   set_terminology do |t|
    t.root(path: "metadatas")
    
    t.acronym
    
    t.address{
      t.country
      t.geo_latitude
      t.geo_longitude
      t.locality_city_town
      t.post_code
      t.street
      
    }
    
    t.affiliation{
        t.acronym
        t.name
        t.rec_id
        t.role
    }
    
    t.identifier{
      t.type
      t.value
    }
    
    
    t.date_foundation
    t.date_dissolution
    t.email
    
    
    t.name
   
    t.nationality
    
    
    t.phone{
      t.formatted
    }
    

    t.note{
      t.language
      t.value
    }
    
    t.url{
      t.value
    }
    
    t.rec_class
    t.rec_id
    

  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |t|
    
      t.metadatas {
         t.acronym
    
          t.address{
            t.country
            t.geo_latitude
            t.geo_longitude
            t.locality_city_town
            t.post_code
            t.street
            
          }
          
          t.affiliation{
              t.acronym
              t.name
              t.rec_id
              t.role
          }
          
          t.identifier{
            t.type
            t.value
          }
          
          
          t.date_foundation
          t.date_dissolution
          t.email
          
          
          t.name
         
          t.nationality
          
          
          t.phone{
            t.formatted
          }
          
      
          t.note{
            t.language
            t.value
          }
          
          t.url{
            t.value
          }
          
          t.rec_class
          t.rec_id
  
      }
    end
    
    return builder.doc
    
    
    
    
    
  end
end