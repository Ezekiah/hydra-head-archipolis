#encoding:utf-8
require 'datastreams/speaker_metadata'


require 'concerns/metadatas.rb'



class Speaker < ActiveFedora::Base
  
    has_metadata 'descMetadata', type:SpeakerMetadata
    
    has_attributes :name_original, datastream: 'descMetadata', multiple: false
    has_attributes :name_nick, datastream: 'descMetadata', multiple: false
    has_attributes :rec_id, datastream: 'descMetadata', multiple: false
    has_attributes :role, datastream: 'descMetadata', multiple: false
    has_attributes :role_description, datastream: 'descMetadata', multiple: false
    
    include Common_metadata
    
    belongs_to :Study, :property => :is_part_of
    
    
    
    def get_title
      return "#{self.name_original} #{self.role.to_s}"
    end
    
      
    
    def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
        
        
         t.speaker{
         	  
         	  t.name_original(:type=>'text', :display=>'public')
              t.name_nick(:type=>'text', :display=>'public')
         	  
              t.role(:type=>'select', :collection=>'speaker_role', :multiple=>'false', :display=>'public')
              t.role_description(:type=>'text_area', :multiple=>'false', :display=>'public')
              
              
              
              t.rec_class(:type=>'hidden', :value=>'Speaker', :display=>'public')
              t.rec_delete(:type=>'hidden', :value=>false, :label=>'', :display=>'public', 'data-name'=>'rec_delete')

              
          }  
       

       
    end
    
    return builder.doc
    
  end

  
end