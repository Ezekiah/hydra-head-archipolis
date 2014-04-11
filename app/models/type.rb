require 'datastreams/type_metadata'

class Type < ActiveFedora::Base
  has_many :type_entries, :property=>:is_part_of, :class_name=>"Type_entry"
  
  has_metadata 'descMetadata', type:TypeMetadata
  
  has_attributes :title, datastream: 'descMetadata', multiple: false
end
