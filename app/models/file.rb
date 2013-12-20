require 'datastreams/file_metadata'

class File < ActiveFedora::Base
    has_metadata 'descMetadata', type:FileMetadata
    
    has_attributes :name, datastream: 'descMetadata', multiple: false
    has_attributes :type, datastream: 'descMetadata', multiple: false
    
    belongs_to :ressource, :property => :is_part_of
    belongs_to :collection,:property => :is_part_of
    
end
