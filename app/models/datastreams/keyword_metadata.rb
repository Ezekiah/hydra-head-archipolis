class KeywordMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
         t.root(path: "metadatas")
         t.language
         t.value

  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
        xml.language
        xml.value
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
  def self.xml_form
      
    builder = Nokogiri::XML::Builder.new do |t|
        
    t.metadatas{
      t.language(:type=>'select', :multiple=>'false', :required=>true, :label=>'Language')
      t.value(:type=>'text', :required=>true, :label=>'Keyword')
    }
    end
    
    return builder.doc
    
  end
  
end