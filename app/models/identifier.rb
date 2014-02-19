require 'datastreams/identifier_metadata'

class Identifier < ActiveFedora::Base
    has_metadata 'descMetadata', type:IdentifierMetadata
    
    has_attributes :id_type, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    
    

    belongs_to :Person, :property => :is_member_of_collection
    belongs_to :Orgunit, :property => :is_member_of_collection

end
