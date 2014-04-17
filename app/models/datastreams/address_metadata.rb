class AddressMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
        t.root(path: "metadatas")
        t.p_country
        t.geo_latitude
        t.geo_longitude
        t.locality_city_town
        t.post_code
        t.street
        t.rec_class
        t.rec_id
        t.rec_delete
        t.id
  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |t|
    
      t.metadatas {
        t.p_country
        t.geo_latitude
        t.geo_longitude
        t.locality_city_town
        t.post_code
        t.street
        t.rec_class
        t.rec_id
        t.rec_delete
        t.id
      }
  
  
    end
    
    return builder.doc
   
    
    
    
    
  end
  
  
  
  
end