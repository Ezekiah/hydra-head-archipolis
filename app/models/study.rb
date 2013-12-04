require 'datastreams/study_metadata'

class Study < ActiveFedora::Base
  has_metadata 'descMetadata', type:StudyMetadata

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false
  has_attributes :locationofunitsofobservation, datastream: 'descMetadata', multiple: false
  has_attributes :abstract, datastream: 'descMetadata', multiple: false
  has_attributes :general, datastream: 'descMetadata', multiple: false
  has_attributes :affiliation, datastream: 'descMetadata', multiple: false
  has_attributes :keywords, datastream: 'descMetadata', multiple: false
  has_attributes :copyright, datastream: 'descMetadata', multiple: false
  has_attributes :discipline, datastream: 'descMetadata', multiple: false
  has_attributes :methodofdatacollection, datastream: 'descMetadata', multiple: false
  has_attributes :contact, datastream: 'descMetadata', multiple: false
  has_attributes :actor, datastream: 'descMetadata', multiple: false
  has_attributes :targetgroups, datastream: 'descMetadata', multiple: false
  has_attributes :collsitu, datastream: 'descMetadata', multiple: false
  has_attributes :accessconditions, datastream: 'descMetadata', multiple: false
  has_attributes :relpubl, datastream: 'descMetadata', multiple: false
  has_attributes :colldate, datastream: 'descMetadata', multiple: false
  has_attributes :anonymization, datastream: 'descMetadata', multiple: false
  has_attributes :corpus, datastream: 'descMetadata', multiple: false
  has_attributes :authenty, datastream: 'descMetadata', multiple: false
  has_attributes :sampprocedure, datastream: 'descMetadata', multiple: false
  has_attributes :distrbtr, datastream: 'descMetadata', multiple: false
  has_attributes :description, datastream: 'descMetadata', multiple: false
  has_attributes :topicclassification, datastream: 'descMetadata', multiple: false
  has_attributes :nation, datastream: 'descMetadata', multiple: false
  has_attributes :timedimension, datastream: 'descMetadata', multiple: false
  has_attributes :modedatacollection, datastream: 'descMetadata', multiple: false
  has_attributes :numberofunits, datastream: 'descMetadata', multiple: false
  has_attributes :studydates, datastream: 'descMetadata', multiple: false
  has_attributes :timeperiodcovered, datastream: 'descMetadata', multiple: false
  has_attributes :spatialunits, datastream: 'descMetadata', multiple: false
  has_attributes :datakind, datastream: 'descMetadata', multiple: false
  has_attributes :weighting, datastream: 'descMetadata', multiple: false
  has_attributes :edition, datastream: 'descMetadata', multiple: false
  has_attributes :universe, datastream: 'descMetadata', multiple: false
  has_attributes :numberoffiles, datastream: 'descMetadata', multiple: false
  has_attributes :locarch, datastream: 'descMetadata', multiple: false
  has_attributes :analysis, datastream: 'descMetadata', multiple: false
  has_attributes :methode , datastream: 'descMetadata', multiple: false
  has_attributes :grantno, datastream: 'descMetadata', multiple: false
  has_attributes :idno, datastream: 'descMetadata', multiple: false
  has_attributes :observunits, datastream: 'descMetadata', multiple: false
  has_attributes :langdata, datastream: 'descMetadata', multiple: false
  has_attributes :editor, datastream: 'descMetadata', multiple: false
  has_attributes :geogcover, datastream: 'descMetadata', multiple: false
  has_attributes :transcription, datastream: 'descMetadata', multiple: false
  has_attributes :firstedition, datastream: 'descMetadata', multiple: false
  has_attributes :fundag, datastream: 'descMetadata', multiple: false
  has_attributes :latestedition, datastream: 'descMetadata', multiple: false
  has_attributes :software, datastream: 'descMetadata', multiple: false
  has_many :documents, :property=> :is_part_of
  
end
