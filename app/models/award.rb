require 'datastreams/award_metadata'

class Award < ActiveFedora::Base
    has_metadata 'descMetadata', type:AwardMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    
    belongs_to :Project, :property => :is_part_of

end
