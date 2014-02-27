require 'datastreams/description_metadata'

class Keyword < ActiveFedora::Base
    has_metadata 'descMetadata', type:KeywordMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    
    belongs_to :Study, :property => :is_member_of_collection

end
