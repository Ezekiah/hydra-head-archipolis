#encoding:utf-8
require 'datastreams/metadatas.rb'
require 'datastreams/person_metadata'

class Person < ActiveFedora::Base
  
    has_metadata 'descMetadata', type:PersonMetadata
    

    
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
    has_attributes :notes, datastream: 'descMetadata', multiple: true
    
    has_attributes :phones, datastream: 'descMetadata', multiple: true
    
    has_attributes :study_role, datastream: 'descMetadata', multiple: false
    has_attributes :study_role_description, datastream: 'descMetadata', multiple: false
  
    has_many :studies, :property=>:is_member_of_collection
    
    include Common_metadata
    
    
    
    has_attributes :rec_permission, datastream: 'descMetadata', multiple: true
    
    belongs_to :study, :property=>'is_member_of_collection'
    
    
    has_many :affiliations, :property=>:is_member_of_collection
    has_many :addresses, :property=>:is_member_of_collection
    has_many :identifiers, :property=>:is_member_of_collection
    
    accepts_nested_attributes_for :affiliations, allow_destroy: true
    accepts_nested_attributes_for :addresses, allow_destroy: true
    accepts_nested_attributes_for :identifiers, allow_destroy: true
    
    
    
  def self.xml_form
    builder = Nokogiri::XML::Builder.new do |t|
     
         
         t.person{

             t.rec_id(:type=>'text', :value=>'', :label=>'Identifier', :required=>true, :display=>'private')
             
             t.association(:name=>'addresses', :label=>'Address', :display=>'private'){
              t.properties{ t.property(:name=>'addresses', :class_name=>'Address')}
              }
              
             
              
              t.association(:name=>'identifiers', :label=>'Identifier', :display=>'private'){
               t.properties{t.property(:name=>'identifiers', :class_name=>'Identifier', :display=>'private')}
              }
            
            
            t.date_birth(:type=>'date', :label=>'Birth date', :required=>true, :display=>'private')
            t.date_death(:type=>'date', :label=>'Date of death', :required=>true, :display=>'private')
            t.emails(:type=>'text', :multiple=>'true', :label=>'Email', :required=>true, :display=>'private')
            
            t.gender(:type=>'radio_buttons', :collection=>{'homme'=>'0', 'femme'=>1}, :label=>'Sex', :display=>'private')
            
            t.name_family(:type=>'text', :label=>'Family name', :display=>'public')
            t.name_nick(:type=>'text', :label=>'Surname', :display=>'private')
            t.name_given(:type=>'text', :label=>'Given name', :display=>'public')
            t.name_prefix(:type=>'text', :label=>'Particle non dropping', :display=>'private')
            t.name_suffix(:type=>'text', :label=>'Terms of address', :display=>'private')
            t.nationality(:type=>'country', :label=>'Nationality', :display=>'private')
            
            
             t.association(:name=>'affiliations', :label=>'Affiliation', :display=>'public'){
               t.properties{t.property(:name=>'affiliations', :class_name=>'Affiliation')}
              }
            
            t.phones(:type=>'text', :label=>'Phone', :display=>'private')
            
            t.rec_class(:type=>'hidden', :value=>'Person', :display=>'public')
            
           
            
            t.notes(:type=>'text', :multiple=>true, :label=>'Note', :display=>'private')
            
            t.study_role(:type=>'checkbox', :collection=>{'speaker'=>'speaker', 'investigator'=>'investigator', 
              'protagonist'=>'protagonist', 'depositor'=>'depositor'}, :label=>'Study role', :display=>'private')
              
            t.study_role_description(:type=>'text', :multiple=>false, :label=>'Study role description', :display=>'private')
            t.rec_delete(:type=>'hidden', :value=>false, :display=>'public')
            
        }
        
       
    
    
  end
  
  return builder.doc

    
    
    
    
  end
  
  

  
end
