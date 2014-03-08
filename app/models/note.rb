require 'datastreams/note_metadata'

class Note < ActiveFedora::Base
    has_metadata 'descMetadata', type:DescriptionMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    
    belongs_to :Study, :property => :is_member_of_collection
    
    
    def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
        
       
            
          t.note{
               t.language(:type=>'language_list', :multiple=>'false', :label=>'Language', :required=>true, :display=>'public')
               t.value(:type=>'text_area', :label=>'Value', :required=>true, :display=>'public')
               t.rec_class(:type=>'hidden', :value=>'Note', :display=>'public')
              
          }
            
         
       
    end
    
    return builder.doc
    
  end
    

end
