require 'datastreams/description_metadata'

class Description < ActiveFedora::Base
    has_metadata 'descMetadata', type:DescriptionMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    
    belongs_to :Study, :property => :is_member_of_collection

end
