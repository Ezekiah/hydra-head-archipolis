require 'datastreams/description_metadata'

class Keyword < ActiveFedora::Base
    has_metadata 'descMetadata', type:KeywordMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    
    belongs_to :Study, :property => :is_member_of_collection
    
    
   def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
          
     
        
        t.keyword{
            t.language(:type=>'language_list', :multiple=>'false', :required=>true, :label=>'Language')
            t.value(:type=>'text_area', :required=>true, :label=>'Keyword')
            t.rec_class(:type=>'hidden', :value=>'Keyword')
            
        }
          
          
        
      
      end
      
      return builder.doc
    
  end

end
