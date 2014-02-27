require 'datastreams/address_metadata'

class Address < ActiveFedora::Base
    has_metadata 'descMetadata', type:AddressMetadata
    
    has_attributes :p_country, datastream: 'descMetadata', multiple: false
    has_attributes :geo_latitude, datastream: 'descMetadata', multiple: false
    
    has_attributes :geo_longitude, datastream: 'descMetadata', multiple: false
    has_attributes :locality_city_town, datastream: 'descMetadata', multiple: false
    has_attributes :post_code, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    
    has_attributes :street, datastream: 'descMetadata', multiple: false

    belongs_to :Person, :property => :is_member_of_collection
    belongs_to :Orgunit, :property => :is_member_of_collection

end
