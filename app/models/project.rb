require 'datastreams/project_metadata'

class Project < ActiveFedora::Base
  
    has_metadata 'descMetadata', type:ProjectMetadata
    
    
    has_attributes :title, datastream: 'descMetadata', multiple: false
    has_attributes :acronym, datastream: 'descMetadata', multiple: false
    has_attributes :date_begin, datastream: 'descMetadata', multiple: false
    has_attributes :date_end, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    
    belongs_to :study, :property=>:is_part_of
    
    has_many :awards, :property=>:is_part_of
    has_many :descriptions, :property=>:is_part_of
    has_many :identifiers, :property=>:is_part_of
    
    has_many :orgunits, :property=>:is_part_of
    
    has_many :funding_agent_names, :class_name => 'Orgunit', :foreign_key => 'funding_agent_name', :property => :is_part_of
    
    
    has_many :funding_agent_names, :class_name => 'Orgunit', :property => :is_part_of, :foreign_key => 'orgunit_funding_agent_names'
    accepts_nested_attributes_for :funding_agent_names
    
    accepts_nested_attributes_for :awards
    accepts_nested_attributes_for :descriptions
    accepts_nested_attributes_for :identifiers
    accepts_nested_attributes_for :orgunits
    
    
    
  def as_json(options={})
    {}
  end
  
  

  
end
