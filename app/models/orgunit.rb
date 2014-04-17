#encoding:utf-8
require 'datastreams/orgunit_metadata'
require 'concerns/metadatas.rb'

class Orgunit < ActiveFedora::Base
  
  has_metadata 'descMetadata', type:OrgunitMetadata
  
  has_attributes :acronym, datastream: 'descMetadata', multiple: false
  has_attributes :name, datastream: 'descMetadata', multiple: false
  
  #has_attributes :addresses, datastream: 'descMetadata', multiple: true

  has_attributes :identifiers, datastream: 'descMetadata', multiple: true

  has_attributes :emails, datastream: 'descMetadata', multiple: true

  has_attributes :nationality, datastream: 'descMetadata', multiple: false
  
  has_attributes :phones, datastream: 'descMetadata', multiple: true
  has_attributes :urls, datastream: 'descMetadata', multiple: true
  
  
  
  include Common_metadata
  
  has_attributes :notes, datastream: 'descMetadata', multiple: true
 
  has_many :studies, :property=>:is_part_of
  has_many :affiliations, :property=>:is_part_of
  has_many :addresses, :property=>:is_part_of
  has_many :identifiers, :property=>:is_part_of
  
  accepts_nested_attributes_for :affiliations, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :identifiers, allow_destroy: true
  
  def self.xml_form
      
      
      
      builder = Nokogiri::XML::Builder.new do |t|
        
            
            
          t.orgunit{
            
              t.name(:type=>'text', :value=>'', :label=>'Name', :display=>'public')
              
              t.rec_id(:type=>'text', :value=>'', :label=>'Identifier', :display=>'private')
              
              t.association(:name=>'addresses', :class_name=>'Address', :display=>'private')
               
              
              t.association(:name=>'affiliations', :class_name=>'Affiliation', :display=>'private')
               
              
              t.association(:name=>'identifiers',:class_name=>'Identifier', :display=>'private')
               
    
              
              
            
              t.emails(:type=>'text', :multiple=>'true', :label=>'Email', :display=>'private')
              
              
              t.nationality(:type=>'country', :label=>'Nationality', :display=>'private')
              t.rec_class(:type=>'hidden', :value=>'Orgunit', :display=>'public')
              
              
              
              t.date_foundation(:type=>'date', :label=>'Foundation date', :display=>'private')
              t.date_dissolution(:type=>'date', :label=>'Dissolution date', :display=>'private')
              t.phones(:type=>'text', :multiple=>true, :label=>'Phone', :display=>'private')
              
              t.notes(:type=>'text', :multiple=>true, :label=>'Note', :display=>'private')
              
             
              t.rec_delete(:type=>'hidden', :value=>false, :label=>'', :display=>'public', 'data-name'=>'rec_delete')
                
              t.urls(:type=>'text', :multiple=>true, :label=>'Web page', :display=>'private')
              
              
          }
          
         
      
    
    end
    
    return builder.doc

  end

  
end
