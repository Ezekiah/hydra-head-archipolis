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
  
  def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
    
  
       
          t.project{
              
              t.acronym(:type=>'text', :value=>'', :label=>'Acronym', :display=>'public')
              
              
              t.title(:type=>'text', :value=>'', :label=>'Identifier', :required=>true, :display=>'public')
              
              
              t.association(:name=>'awards', :label=>'awards', :required=>false, :display=>'private'){
                 t.properties{
                    t.property(:name=>'awards', :class_name=>'Award')
                  }          
              }
              
              t.association(:name=>'descriptions', :label=>'descriptions', :required=>true, :display=>'private'){
                 t.properties{
                    t.property(:name=>'descriptions', :class_name=>'Description')
                  }          
              }
              
              t.association(:name=>'identifiers', :label=>'identifiers', :required=>true, :display=>'public'){
                 t.properties{
                    t.property(:name=>'identifiers', :class_name=>'Identifier')
                  }          
              }
              
              t.association(:name=>'funding_agent_names', :label=>'Funding agent names', :required=>true, :display=>'public'){
                 t.properties{
                    t.property(:name=>'funding_agent_names', :class_name=>'Orgunit')
                  }          
              }
              
    
              t.rec_class(:type=>'hidden', :value=>'Project')
              
              t.date_begin(:type=>'date', :format=>'dd/mm/yyyy', :viewMode=> "days", :minViewMode=> "days", :required=>true, :display=>'private')
              t.date_end(:type=>'date', :format=>'dd/mm/yyyy', :viewMode=> "days", :minViewMode=> "days", :required=>true, :display=>'private')
              

           }
       
    end
    
    return builder.doc
    
  end
  
  

  
end
