class IdentifierMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
     t.root(path: "metadatas")
     t.id_type
     t.value
         
  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
         xml.id_type
         
         xml.value
      }
  
  
    end
    
    return builder.doc

  end
  
  
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
          }  

            
        end
        
        return builder.doc
    
    end
    
    
  
end