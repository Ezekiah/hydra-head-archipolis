require 'datastreams/collection_metadata'

class Collection < ActiveFedora::Base
    has_metadata 'descMetadata', type:CollectionMetadata
    
    has_attributes :name, datastream: 'descMetadata', multiple: false
    has_attributes :type, datastream: 'descMetadata', multiple: false
    
    has_many :collections, :property=>:is_member_of_collection
    has_many :ressources, :property=>:is_member_of_collection
    belongs_to :collection, :property => :is_member_of_collection
    belongs_to :study, :property => :is_member_of_collection
    
    has_many :files
    
   def as_json(options={})
    { :id => self.id,
      :name => self.name,
      :collections => self.collections,
      :ressources => self.ressources,
      
      
    }
  end
end
