class KeywordMetadata < ActiveFedora::OmDatastream

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
        
   
      
      t.keyword{
          t.language(:type=>'language_list', :multiple=>'false', :required=>true, :label=>'Language')
          t.value(:type=>'text_area', :required=>true, :label=>'Keyword')
          t.rec_class(:type=>'hidden', :value=>'Keyword')
          
      }
        
        
      
    
    end
    
    return builder.doc
    
  end
  
end