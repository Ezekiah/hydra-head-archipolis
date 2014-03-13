require 'datastreams/description_metadata'
require 'datastreams/metadatas.rb'

class Description < ActiveFedora::Base
    has_metadata 'descMetadata', type:DescriptionMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    include Common_metadata
    
    belongs_to :Study, :property => :is_member_of_collection
    
    def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
        
       
            
          t.description{
               t.language(:type=>'language_list', :multiple=>'false', :label=>'Language', :required=>true, :display=>'public')
               t.value(:type=>'text_area', :label=>'Value', :required=>true, :display=>'public')
               t.rec_class(:type=>'hidden', :value=>'Description', :display=>'public')
               t.rec_id(:type=>'hidden', :value=>'', :display=>'public')
              
          }
            
         
       
    end
    
    return builder.doc
    
  end

end
