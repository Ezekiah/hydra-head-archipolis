require 'datastreams/description_metadata'
require 'datastreams/metadatas.rb'

class Keyword < ActiveFedora::Base
    has_metadata 'descMetadata', type:KeywordMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    include Common_metadata
    
    belongs_to :Study, :property => :is_member_of_collection
    
    
   def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|

        t.keyword{
            t.language(:type=>'language_list', :multiple=>'false', :required=>true, :label=>'Language')
            t.value(:type=>'text_area', :required=>true, :label=>'Keyword')
            t.rec_class(:type=>'hidden', :value=>'Keyword')
            t.rec_id(:type=>'hidden', :value=>'', :display=>'public')
            t.rec_delete(:type=>'hidden', :value=>false, :display=>'public')
            
        }
          
          
        
      
      end
      
      return builder.doc
    
  end

end
