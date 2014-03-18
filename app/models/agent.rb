#encoding:utf-8
require 'datastreams/agent_metadata'


class Agent < ActiveFedora::Base
  
  has_metadata 'descMetadata', type:AgentMetadata
    
  has_attributes :rec_class, datastream: 'descMetadata', multiple: false
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  
  has_many :orgunits, :property=>:is_part_of, :class_name=>"Orgunit"
  has_many :persons, :property=>:is_part_of, :class_name=>"Person"
 
  
  accepts_nested_attributes_for :orgunits
  accepts_nested_attributes_for :persons
 
  
  def self.xml_form
      
      
      
      builder = Nokogiri::XML::Builder.new do |t|
       
       t.agent{      
          t.association(:type=>'association', :name=>'orgunits',  :display=>'public', :class_name=>'Orgunit')
          t.association(:type=>'association', :name=>'persons',  :display=>'public', :class_name=>'Person')
          t.rec_class(:type=>'hidden', :value=>'Agent')
          t.rec_id(:type=>'hidden', :value=>'', :display=>'public')
          t.rec_delete(:type=>'hidden', :value=>false, :display=>'public')
       
       }  
          
         
      
    
    end
    
    return builder.doc

  end

  
end
