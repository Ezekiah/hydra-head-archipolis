class NoteMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
         t.root(path: "metadatas")
         t.language
         t.value
         t.rec_class

  end
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
        xml.language
        xml.value
        xml.rec_class
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
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