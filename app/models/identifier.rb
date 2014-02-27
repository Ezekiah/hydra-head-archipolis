require 'datastreams/identifier_metadata'

class Identifier < ActiveFedora::Base
    has_metadata 'descMetadata', type:IdentifierMetadata
    
    has_attributes :id_type, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    

    belongs_to :Person, :property => :is_part_of
    belongs_to :Orgunit, :property => :is_part_of
    
    belongs_to :Project, :property => :is_part_of

end
