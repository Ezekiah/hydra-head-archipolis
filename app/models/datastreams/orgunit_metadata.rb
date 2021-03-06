class OrgunitMetadata < ActiveFedora::OmDatastream

   set_terminology do |t|
    t.root(path: "metadatas")
    
    t.acronym
    t.rec_delete
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
    t.id


  end
  
  
  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |t|
    
      t.metadatas {
        
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
	    t.id
	  }
  
  
    end
    
    return builder.doc
    
  end
  

  
end