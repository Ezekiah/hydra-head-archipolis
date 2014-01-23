require 'datastreams/orgunit_metadata'

class Orgunit < ActiveFedora::Base
  
  has_metadata 'descMetadata', type:OrgunitMetadata
  
  
  has_attributes :acronym, datastream: 'descMetadata', multiple: false
  
  has_attributes :addresses, datastream: 'descMetadata', multiple: true
  has_attributes :affiliations, datastream: 'descMetadata', multiple: true
  
  has_attributes :identifiers, datastream: 'descMetadata', multiple: true
  
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
  
  has_attributes :phones, datastream: 'descMetadata', multiple: true
  has_attributes :urls, datastream: 'descMetadata', multiple: true
  
  has_attributes :rec_class, datastream: 'descMetadata', multiple: false
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  
  has_attributes :notes, datastream: 'descMetadata', multiple: true
  
  has_attributes :study_role, datastream: 'descMetadata', multiple: false
  has_attributes :study_role_description, datastream: 'descMetadata', multiple: false
  has_attributes :rec_permission, datastream: 'descMetadata', multiple: true


  has_many :studies, :property=>:is_member_of_collection
  

  
end
