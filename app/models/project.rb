require 'datastreams/project_metadata'
require 'concerns/metadatas.rb'

class Project < ActiveFedora::Base
  
    has_metadata 'descMetadata', type:ProjectMetadata
    
    
    has_attributes :title, datastream: 'descMetadata', multiple: false
    has_attributes :acronym, datastream: 'descMetadata', multiple: false
    has_attributes :date_begin, datastream: 'descMetadata', multiple: false
    has_attributes :date_end, datastream: 'descMetadata', multiple: false
    
    include Common_metadata
    
    
    belongs_to :study, :property=>:is_part_of
    
    has_many :awards, :property=>:is_part_of
    has_many :descriptions, :property=>:is_part_of
    has_many :identifiers, :property=>:is_part_of
    
    has_many :orgunits, :property=>:is_part_of
    
    #has_many :funding_agent_names, :class_name => 'Orgunit', :foreign_key => 'funding_agent_name', :property => :is_part_of
    
    
    #has_many :funding_agent_names, :class_name => 'Orgunit', :property => :is_part_of, :foreign_key => 'orgunit_funding_agent_names'
    
    
    #accepts_nested_attributes_for :funding_agent_names, allow_destroy: true
    accepts_nested_attributes_for :awards, allow_destroy: true
    accepts_nested_attributes_for :descriptions, allow_destroy: true
    accepts_nested_attributes_for :identifiers, allow_destroy: true
    accepts_nested_attributes_for :orgunits, allow_destroy: true
    
    
    
  def as_json(options={})
    {}
  end
  
  def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
    
  
       
          t.project{
              
              t.acronym(:type=>'text', :value=>'', :label=>'Acronym', :display=>'public')
              
              
              t.title(:type=>'text', :value=>'', :label=>'Identifier', :required=>true, :display=>'public')
              
              
              #t.association(:type=>'association', :name=>'awards', :class_name=>'Award', :required=>false, :display=>'private')
                
              
              #t.association(:type=>'association', :name=>'descriptions', :class_name=>'Description', :required=>true, :display=>'public')
              t.association(:type=>'association', :name=>'orgunits', :class_name=>'Orgunit', :required=>true, :display=>'public')
              t.association(:type=>'association', :name=>'identifiers', :class_name=>'Identifier', :required=>true, :display=>'public')
              
              
               
              
    
              t.rec_class(:type=>'hidden', :value=>'Project')
              
              #t.date_begin(:type=>'date', :format=>'dd/mm/yyyy', :viewMode=> "days", :minViewMode=> "days", :required=>true, :display=>'public')
              #t.date_end(:type=>'date', :format=>'dd/mm/yyyy', :viewMode=> "days", :minViewMode=> "days", :required=>true, :display=>'public')
              #t.rec_id(:type=>'hidden', :value=>'', :display=>'public')
              t.rec_delete(:type=>'hidden', :value=>false, :display=>'public')
              

           }
       
    end
    
    return builder.doc
    
  end
  
  

  
end
