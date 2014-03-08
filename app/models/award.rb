require 'datastreams/award_metadata'

class Award < ActiveFedora::Base
    has_metadata 'descMetadata', type:AwardMetadata
    
    has_attributes :language, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    has_attributes :rec_class, datastream: 'descMetadata', multiple: false
    
    belongs_to :Project, :property => :is_part_of
    
    def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
        
        t.award{
          t.language(:type=>'language_list', :multiple=>'false', :label=>'Language', :required=>true, :display=>'public')
          t.value(:type=>'text_area', :label=>'Value', :required=>true, :display=>'public')
          t.rec_class(:type=>'hidden', :value=>'Award', :display=>'public')
        }
       
    end
    
    return builder.doc
    
  end

end
