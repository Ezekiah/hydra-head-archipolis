require 'datastreams/collection_metadata'

class Collection < ActiveFedora::Base
    has_metadata 'descMetadata', type:CollectionMetadata
    
    has_attributes :name, datastream: 'descMetadata', multiple: false
    has_attributes :type, datastream: 'descMetadata', multiple: false
    
    has_and_belongs_to_many :collections, :property=>:is_member_of_collection
    has_many :ressources, :property=>:is_member_of_collection
    
    has_many :files
end
