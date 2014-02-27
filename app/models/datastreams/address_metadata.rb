class AddressMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
        t.root(path: "metadatas")
        t.p_country
        t.geo_latitude
        t.geo_longitude
        t.locality_city_town
        t.post_code
        t.street
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
      }
  
  
    end
    
    return builder.doc
   
    
    
    
    
  end
  
  
  def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
       
            
            t.address{
                
                t.p_country(:type=>'countries', :value=>'', :label=>'Country', :display=>'public')
                t.geo_latitude(:type=>'text', :value=>'', :label=>'Geo latitude', :display=>'public')
                t.geo_longitude(:type=>'text', :value=>'', :label=>'Geo longitude', :display=>'public')
                t.locality_city_town(:type=>'text', :value=>'', :label=>'City town', :display=>'public')
                t.post_code(:type=>'text', :value=>'', :label=>'Post code', :display=>'public')
                t.rec_class(:type=>'hidden', :value=>'Address', :label=>'', :display=>'public')
                t.street(:type=>'text_area', :value=>'', :label=>'Street', :display=>'public')
                
            }
        

      end
    
     return builder.doc
  end
  
end