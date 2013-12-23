require 'datastreams/ressource_metadata'

class Ressource < ActiveFedora::Base
    has_metadata 'descMetadata', type:RessourceMetadata
    
    has_attributes :name, datastream: 'descMetadata', multiple: false
    has_attributes :type, datastream: 'descMetadata', multiple: false
    
    has_many :files, :property => :is_member_of_collection, :class_name => "ActiveFedora::Base"
    has_many :ressources, :property=>:is_member_of_collection
    
    belongs_to :collection, :property => :is_member_of_collection
    belongs_to :study, :property => :is_member_of_collection
    belongs_to :ressource, :property => :is_member_of_collection
    
    
end
