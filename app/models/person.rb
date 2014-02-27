require 'datastreams/person_metadata'

class Person < ActiveFedora::Base
  
    has_metadata 'descMetadata', type:PersonMetadata
    

    
    has_attributes :date_birth, datastream: 'descMetadata', multiple: false
    has_attributes :date_death, datastream: 'descMetadata', multiple: false
    has_attributes :emails, datastream: 'descMetadata', multiple: true
    has_attributes :gender, datastream: 'descMetadata', multiple: false
    
    has_attributes :name_family, datastream: 'descMetadata', multiple: false
    has_attributes :name_nick, datastream: 'descMetadata', multiple: false
    has_attributes :name_given, datastream: 'descMetadata', multiple: false
    has_attributes :name_prefix, datastream: 'descMetadata', multiple: false
    has_attributes :name_suffix, datastream: 'descMetadata', multiple: true
    
    has_attributes :nationality, datastream: 'descMetadata', multiple: false
    has_attributes :notes, datastream: 'descMetadata', multiple: true
    
    has_attributes :phones, datastream: 'descMetadata', multiple: true
    
    has_attributes :study_role, datastream: 'descMetadata', multiple: false
    has_attributes :study_role_description, datastream: 'descMetadata', multiple: false
  
    has_many :studies, :property=>:is_member_of_collection
    
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    has_attributes :rec_id, datastream: 'descMetadata', multiple: false
   
    has_attributes :rec_permission, datastream: 'descMetadata', multiple: true
    
    belongs_to :study, :property=>'is_member_of_collection'
    
    
    has_many :affiliations, :property=>:is_member_of_collection
    has_many :addresses, :property=>:is_member_of_collection
    has_many :identifiers, :property=>:is_member_of_collection
    
    accepts_nested_attributes_for :affiliations
    accepts_nested_attributes_for :addresses
    accepts_nested_attributes_for :identifiers
    
    
    
  def as_json(options={})
    {}
  end
  
  

  
end
