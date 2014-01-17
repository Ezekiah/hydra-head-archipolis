require 'datastreams/study_metadata'
require 'datastreams/tree_metadata'


class Study < ActiveFedora::Base
  
  attr_reader :title
  
  has_metadata 'descMetadata', type:StudyMetadata
  has_metadata 'utilsMetadata', type:TreeMetadata
  
  
  has_attributes :depositor, datastream: 'descMetadata', multiple: true
  has_attributes :copyright_holder, datastream: 'descMetadata', multiple: true
  has_attributes :software, datastream: 'descMetadata', multiple: true
  has_attributes :editor, datastream: 'descMetadata', multiple: true
  has_attributes :edition_first_date, datastream: 'descMetadata', multiple: false
  has_attributes :edition_last_date, datastream: 'descMetadata', multiple: false
  has_attributes :distributor, datastream: 'descMetadata', multiple: true
  has_attributes :project, datastream: 'descMetadata', multiple: true
  has_attributes :author, datastream: 'descMetadata', multiple: true
  
  
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  has_attributes :title, datastream: 'descMetadata', multiple: false
  
  #obsolete
  has_attributes :name, datastream: 'descMetadata', multiple: false
  
  
  has_attributes :documents_count, datastream: 'descMetadata', multiple: false
  has_attributes :archive_extent, datastream: 'descMetadata', multiple: false
  has_attributes :archive_location, datastream: 'descMetadata', multiple: false
  has_attributes :access_conditions, datastream: 'descMetadata', multiple: false
  
  

  has_attributes :contact, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_modes, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_context, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_method, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_sampling, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_time_dimension, datastream: 'descMetadata', multiple: true
  has_attributes :publication, datastream: 'descMetadata', multiple: true
  has_attributes :description, datastream: 'descMetadata', multiple: true
  has_attributes :analysis_type, datastream: 'descMetadata', multiple: true
  has_attributes :analysis_anonymization, datastream: 'descMetadata', multiple: false
  has_attributes :keyword, datastream: 'descMetadata', multiple: true
  
  
  has_attributes :classification, datastream: 'descMetadata', multiple: true
  has_attributes :observation_unit, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_date_begin, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_date_end, datastream: 'descMetadata', multiple: false
  has_attributes :documents_type, datastream: 'descMetadata', multiple: true
  has_attributes :analysis_transcription, datastream: 'descMetadata', multiple: false
  has_attributes :coverage_spatial_geographic, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_spatial_units, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_spatial_country, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_temporal_begin, datastream: 'descMetadata', multiple: false
  has_attributes :coverage_temporal_end, datastream: 'descMetadata', multiple: false
  has_attributes :target_group, datastream: 'descMetadata', multiple: true
  has_attributes :location_of_units_of_observation, datastream: 'descMetadata', multiple: true
  has_attributes :data_language, datastream: 'descMetadata', multiple: true
  has_attributes :documentation_language, datastream: 'descMetadata', multiple: true



  has_attributes :documents_date_begin, datastream: 'descMetadata', multiple: false
  has_attributes :documents_date_end, datastream: 'descMetadata', multiple: false
  has_attributes :media_file, datastream: 'descMetadata', multiple: true
  has_attributes :documents_transc_count, datastream: 'descMetadata', multiple: false
  has_attributes :interviewer, datastream: 'descMetadata', multiple: true
  has_attributes :archive_completeness, datastream: 'descMetadata', multiple: false
  has_attributes :archive_arrangement_level, datastream: 'descMetadata', multiple: false
  has_attributes :archive_consentement, datastream: 'descMetadata', multiple: false
  has_attributes :archive_agreememt, datastream: 'descMetadata', multiple: false
  has_attributes :note, datastream: 'descMetadata', multiple: true


  
  has_attributes :tree, datastream: 'utilsMetadata', multiple: false
  
  
 
  
  has_many :documents, :property=> :is_part_of
  
  has_many :collections, :property => :is_part_of
  
  has_many :ressources, :property => :is_part_of, :through=> :collections
  
   accepts_nested_attributes_for :collections
  accepts_nested_attributes_for :ressources
  
  
  
  def as_json(options={})
    { 
     
      
    }
  end
  
end




