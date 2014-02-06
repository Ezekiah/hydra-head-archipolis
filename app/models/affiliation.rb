require 'datastreams/affiliation_metadata'

class Affiliation < ActiveFedora::Base
    has_metadata 'descMetadata', type:AffiliationMetadata
    
    has_attributes :acronym, datastream: 'descMetadata', multiple: false
    has_attributes :name, datastream: 'descMetadata', multiple: false
    
    has_attributes :rec_id, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    has_attributes :role, datastream: 'descMetadata', multiple: false

    belongs_to :Person, :property => :is_member_of_collection
    belongs_to :Orgunit, :property => :is_member_of_collection
    
    belongs_to :Study, :property => :is_member_of_collection
    
    
end
