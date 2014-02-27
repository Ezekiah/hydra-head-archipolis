require 'datastreams/orgunit_metadata'

class Orgunit < ActiveFedora::Base
  
  has_metadata 'descMetadata', type:OrgunitMetadata
  
  has_attributes :acronym, datastream: 'descMetadata', multiple: false
  
  #has_attributes :addresses, datastream: 'descMetadata', multiple: true

  has_attributes :identifiers, datastream: 'descMetadata', multiple: true

  has_attributes :emails, datastream: 'descMetadata', multiple: true

  has_attributes :nationality, datastream: 'descMetadata', multiple: false
  
  has_attributes :phones, datastream: 'descMetadata', multiple: true
  has_attributes :urls, datastream: 'descMetadata', multiple: true
  
  has_attributes :rec_class, datastream: 'descMetadata', multiple: false
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  
  has_attributes :notes, datastream: 'descMetadata', multiple: true
 
  has_many :studies, :property=>:is_part_of
  has_many :affiliations, :property=>:is_part_of
  has_many :addresses, :property=>:is_part_of
  has_many :identifiers, :property=>:is_part_of
  
  accepts_nested_attributes_for :affiliations
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :identifiers

  
end
