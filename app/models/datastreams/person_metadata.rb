class PersonMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "metadatas")
    
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
    
    
    t.date_birth
    t.date_death
    t.email
    
    t.gender
    t.name_family
    t.name_nick
    t.name_given
    t.name_prefix
    t.name_suffix
    t.nationality
    
    t.note{
      t.language
      t.value
    }
    
    t.study_role
    t.study_role_description
    
    t.rec_class
    t.rec_id

  end
  
  

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |t|
      t.metadatas{
    
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
        
        
        t.date_birth
        t.date_death
        t.email
        
        t.gender
        t.name_family
        t.name_nick
        t.name_given
        t.name_prefix
        t.name_suffix
        t.nationality
        t.rec_class
        t.rec_id
        
        t.note{
          t.language
          t.value
        }
        
        t.study_role
        t.study_role_description
    }
  
  end
  
  return builder.doc

    
    
    
    
  end
end