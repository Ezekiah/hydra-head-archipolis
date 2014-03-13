require 'datastreams/address_metadata'
require 'datastreams/metadatas.rb'


class Address < ActiveFedora::Base
    has_metadata 'descMetadata', type:AddressMetadata
    
    has_attributes :p_country, datastream: 'descMetadata', multiple: false
    has_attributes :geo_latitude, datastream: 'descMetadata', multiple: false
    
    has_attributes :geo_longitude, datastream: 'descMetadata', multiple: false
    has_attributes :locality_city_town, datastream: 'descMetadata', multiple: false
    has_attributes :post_code, datastream: 'descMetadata', multiple: false
    
    
    include Common_metadata
    
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    
    has_attributes :street, datastream: 'descMetadata', multiple: false

    belongs_to :Person, :property => :is_member_of_collection
    belongs_to :Orgunit, :property => :is_member_of_collection
    
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
                t.rec_id(:type=>'hidden', :value=>'', :display=>'public')
                
            }
        

      end
    
     return builder.doc
  end

end
