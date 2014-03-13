require 'datastreams/identifier_metadata'
require 'datastreams/metadatas.rb'

class Identifier < ActiveFedora::Base
    has_metadata 'descMetadata', type:IdentifierMetadata
    
    has_attributes :id_type, datastream: 'descMetadata', multiple: false
    has_attributes :value, datastream: 'descMetadata', multiple: false
    include Common_metadata
    

    belongs_to :Person, :property => :is_part_of
    belongs_to :Orgunit, :property => :is_part_of
    
    belongs_to :Project, :property => :is_part_of
    
    
    def self.xml_form
    
        builder = Nokogiri::XML::Builder.new do |t|
            collection = [
                ['ANR project reference', 'anr'], 
                ['European grant agreement number', 'eu'],
                ['HAL identifier', 'hal'],
                ['Spire identifier', 'hdl'],
            ]
                
                
                
          t.identifier{
              t.id_type(:type=>'select', :collection=>collection, :multiple=>'false', :display=>'public', :prompt=>'identifier_type')
              t.value(:type=>'text_area', :multiple=>'false', :display=>'public')
              
              t.rec_class(:type=>'hidden', :value=>'Identifier', :display=>'public')
              t.rec_id(:type=>'hidden', :value=>'', :display=>'public')    
          }  

            
        end
        
        return builder.doc
    
    end

end
