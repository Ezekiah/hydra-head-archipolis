require 'datastreams/study_metadata'
require 'datastreams/tree_metadata'




class Study < ActiveFedora::Base
  
  #attr_reader :title
  
  has_metadata 'descMetadata', type:StudyMetadata
  has_metadata 'utilsMetadata', type:TreeMetadata
  
  
  
  #validates :title,  :presence => true
  

  has_attributes :softwares, datastream: 'descMetadata', multiple: true
  
  has_attributes :edition_first_date, datastream: 'descMetadata', multiple: false
  has_attributes :edition_last_date, datastream: 'descMetadata', multiple: false
  
  
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  has_attributes :title, datastream: 'descMetadata', multiple: false
  
  #obsolete
  has_attributes :name, datastream: 'descMetadata', multiple: false
  
  
  has_attributes :documents_count, datastream: 'descMetadata', multiple: false
  
  has_attributes :access_conditions, datastream: 'descMetadata', multiple: false
  
  
  has_attributes :contacts, datastream: 'descMetadata', multiple: true
 
  has_attributes :publications, datastream: 'descMetadata', multiple: true

  
 
  
  has_attributes :disciplines, datastream: 'descMetadata', multiple: true
  
  
  has_attributes :classifications, datastream: 'descMetadata', multiple: true
  has_attributes :observation_units, datastream: 'descMetadata', multiple: true
  
  has_attributes :documents_types, datastream: 'descMetadata', multiple: true
  
  
  
  has_attributes :coverage_spatial_geographics, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_spatial_units, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_spatial_countries, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_temporal_begin, datastream: 'descMetadata', multiple: false
  has_attributes :coverage_temporal_end, datastream: 'descMetadata', multiple: false
  has_attributes :target_groups, datastream: 'descMetadata', multiple: true
  has_attributes :location_of_units_of_observations, datastream: 'descMetadata', multiple: true
  
  
  


  has_attributes :documents_date_begin, datastream: 'descMetadata', multiple: false
  has_attributes :documents_date_end, datastream: 'descMetadata', multiple: false

  has_attributes :documents_transc_count, datastream: 'descMetadata', multiple: false
  has_attributes :interviewers, datastream: 'descMetadata', multiple: true
  
  has_attributes :notes, datastream: 'descMetadata', multiple: true
  has_attributes :tree, datastream: 'utilsMetadata', multiple: false
  
  
  
  #METHOD
  has_attributes :data_collection_modes, datastream: 'descMetadata', multiple: true, type:'checkbox'
  has_attributes :data_collection_context, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_methods, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_samplings, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_time_dimensions, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_extent, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_has_media, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_documents_types, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_date_begin, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_date_end, datastream: 'descMetadata', multiple: false
  
  
  
  #CORPUS
  has_attributes :archive_extent, datastream: 'descMetadata', multiple: false
  has_attributes :archive_location, datastream: 'descMetadata', multiple: false
  has_attributes :archive_completeness, datastream: 'descMetadata', multiple: false
  has_attributes :archive_arrangement_level, datastream: 'descMetadata', multiple: false
  has_attributes :archive_consentement, datastream: 'descMetadata', multiple: false
  has_attributes :archive_agreememt, datastream: 'descMetadata', multiple: false
  has_attributes :archive_accessed, datastream: 'descMetadata', multiple: false 
  has_attributes :archive_arrangement_level_description, datastream: 'descMetadata', multiple: false 
  has_attributes :archive_preservation_level, datastream: 'descMetadata', multiple: false 
  has_attributes :archive_preservation_level_description, datastream: 'descMetadata', multiple: false
  
  
  
  #ANALYSE
  has_attributes :analysis_transcription, datastream: 'descMetadata', multiple: false
  has_attributes :analysis_has_transcription, datastream: 'descMetadata', multiple: false
  has_attributes :data_languages, datastream: 'descMetadata', multiple: true
  has_attributes :documentation_languages, datastream: 'descMetadata', multiple: true
  has_attributes :analysis_types, datastream: 'descMetadata', multiple: true
  has_attributes :analysis_anonymization, datastream: 'descMetadata', multiple: false
  has_attributes :publication_citation, datastream: 'descMetadata', multiple: true 
  
  
  
  has_many :collections, :property => :is_part_of
  
  has_many :ressources, :property => :is_part_of, :through=> :collections
  
  
  has_many :orgunit_depositors, :class_name => 'Orgunit', :foreign_key => 'orgunit_depositors', :property => :is_part_of
  has_many :person_depositors, :class_name => 'Person', :foreign_key => 'person_depositors', :property => :is_part_of
  
  has_many :orgunit_interviewers, :class_name => 'Orgunit', :foreign_key => 'orgunit_interviewers', :property => :is_part_of
  has_many :person_interviewers, :class_name => 'Person', :foreign_key => 'person_interviewers', :property => :is_part_of
  
  has_many :orgunit_copyright_holders, :class_name => 'Orgunit', :foreign_key => 'orgunit_depositors', :property => :is_part_of
  has_many :person_copyright_holders, :class_name => 'Person', :foreign_key => 'person_depositors', :property => :is_part_of
  
  has_many :orgunit_authors, :class_name => 'Orgunit', :foreign_key => 'orgunit_authors', :property => :is_part_of
  has_many :person_authors, :class_name => 'Person', :foreign_key => 'person_authors', :property => :is_part_of
  
  has_many :orgunit_distributors, :class_name => 'Orgunit', :foreign_key => 'orgunit_distributors', :property => :is_part_of
  has_many :person_distributors, :class_name => 'Person', :foreign_key => 'person_distributors', :property => :is_part_of
 
  has_many :orgunit_editors, :class_name => 'Orgunit', :foreign_key => 'orgunit_editors', :property => :is_part_of
  has_many :person_editors, :class_name => 'Person', :foreign_key => 'person_editors', :property => :is_part_of
  
  has_many :orgunit_contacts, :class_name => 'Orgunit', :foreign_key => 'orgunit_contacts', :property => :is_part_of
  has_many :person_contacts, :class_name => 'Person', :foreign_key => 'person_contacts', :property => :is_part_of
  
  has_many :orgunit_interviewers_unknown, :class_name => 'Orgunit', :foreign_key => 'orgunit_interviewers_unknown', :property => :is_part_of
  has_many :person_interviewers_unknown, :class_name => 'Person', :foreign_key => 'person_interviewers_unknown', :property => :is_part_of
  
  has_many :persons, :class_name => 'Person', :property => :is_part_of
  has_many :orgunits, :class_name => 'Orgunit', :property => :is_part_of

  has_many :affiliations, :class_name => 'Affiliation', :property => :is_part_of
  
  has_many :descriptions, :class_name => 'Description', :property => :is_part_of
  
  has_many :keywords, :class_name => 'Keyword', :property => :is_part_of
  
  has_many :projects, :class_name => 'Project', :property => :is_part_of
  has_many :notes, :class_name => 'Note', :property => :is_part_of
  
  
  
  
  def editors
    return self.orgunit_depositors + self.person_depositors
  end
  
  
  def depositors
    return self.orgunit_depositors + self.person_depositors
  end
  
  def interviewers
    return self.orgunit_interviewers + self.person_interviewers
  end
  
  def copyright_holders
    return self.orgunit_copyright_holders + self.person_copyright_holders
  end
  
  def authors
    return self.orgunit_authors + self.person_authors
  end
  
  def distributors
    return self.orgunit_distributors + self.person_distributors
  end
  
  def self.data_collection_modes
    {'interview'=>'interview', 'observation'=>'observation', 'content analysis'=>'content analysis', 'questionnaire'=>'questionnaire', 'other'=>'other'}
  
  end
  
  
  
  
  
  
  accepts_nested_attributes_for :descriptions
  accepts_nested_attributes_for :affiliations
  
  accepts_nested_attributes_for :projects
  
  accepts_nested_attributes_for :collections
  accepts_nested_attributes_for :ressources
  accepts_nested_attributes_for :orgunit_depositors
  accepts_nested_attributes_for :person_depositors
  accepts_nested_attributes_for :orgunit_interviewers
  accepts_nested_attributes_for :person_interviewers
  accepts_nested_attributes_for :orgunit_interviewers_unknown
  accepts_nested_attributes_for :person_interviewers_unknown
  accepts_nested_attributes_for :orgunit_copyright_holders
  accepts_nested_attributes_for :person_copyright_holders
  accepts_nested_attributes_for :orgunit_authors
  accepts_nested_attributes_for :person_authors
  accepts_nested_attributes_for :orgunit_distributors
  accepts_nested_attributes_for :person_distributors
  
  
  
  accepts_nested_attributes_for :keywords
  
  accepts_nested_attributes_for :persons
  accepts_nested_attributes_for :orgunits
  
  accepts_nested_attributes_for :person_contacts
  
  
  
  
  def as_json(options={})
    { 
     
      
    }
  end
  
end




