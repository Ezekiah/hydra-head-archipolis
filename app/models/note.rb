require 'datastreams/note_metadata'
require 'datastreams/metadatas.rb'

class Note < ActiveFedora::Base
    has_metadata 'descMetadata', type:DescriptionMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    include Common_metadata
    
    belongs_to :Study, :property => :is_member_of_collection
    
    
    def get_title
      return "#{LanguageList::LanguageInfo.find(object.language).name} #{truncate(object.value.to_s, :length => 17, :separator => '...')}"
    end  
    
    
    def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
        
       
            
          t.note{
               t.language(:type=>'language_list', :multiple=>'false', :label=>'Language', :required=>true, :display=>'public')
               t.value(:type=>'text_area', :label=>'Value', :required=>true, :display=>'public')
               t.rec_class(:type=>'hidden', :value=>'Note', :display=>'public')
               t.rec_id(:type=>'hidden', :value=>'', :display=>'public')
               t.rec_delete(:type=>'hidden', :value=>false, :display=>'public')
              
          }
            
         
       
    end
    
    return builder.doc
    
  end
    

end
