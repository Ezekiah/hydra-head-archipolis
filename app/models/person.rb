require 'datastreams/person_metadata'

class Person < ActiveFedora::Base
  
    has_metadata 'descMetadata', type:PersonMetadata
    
    has_attributes :address, datastream: 'descMetadata', multiple: true
    has_attributes :affiliation, datastream: 'descMetadata', multiple: true
    
    has_attributes :identifier, datastream: 'descMetadata', multiple: true
    
    has_attributes :date_birth, datastream: 'descMetadata', multiple: false
    has_attributes :date_death, datastream: 'descMetadata', multiple: false
    has_attributes :email, datastream: 'descMetadata', multiple: true
    has_attributes :gender, datastream: 'descMetadata', multiple: false
    
    has_attributes :name_family, datastream: 'descMetadata', multiple: false
    has_attributes :name_nick, datastream: 'descMetadata', multiple: false
    has_attributes :name_given, datastream: 'descMetadata', multiple: false
    has_attributes :name_prefix, datastream: 'descMetadata', multiple: false
    has_attributes :name_suffix, datastream: 'descMetadata', multiple: true
    
    has_attributes :nationality, datastream: 'descMetadata', multiple: false
    has_attributes :note, datastream: 'descMetadata', multiple: true
    
    has_attributes :study_role, datastream: 'descMetadata', multiple: false
    has_attributes :study_role_description, datastream: 'descMetadata', multiple: false
  
    has_many :studies, :property=>:is_member_of_collection
    
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    has_attributes :rec_id, datastream: 'descMetadata', multiple: false
   
    

  def as_json(options={})
    {}
  end
  
  

  
end
