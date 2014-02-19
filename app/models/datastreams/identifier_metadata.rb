class IdentifierMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
         t.root(path: "metadatas")
         t.name
         t.acronym
         t.rec_id
         
         t.role
         t.rec_class
  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
         xml.name
         xml.acronym
         xml.rec_id
         xml.role
      }
  
  
    end
    
    return builder.doc

  end
  
  
    def self.xml_form
    
        builder = Nokogiri::XML::Builder.new do |t|
            
            t.metadatas{
              t.name(:type=>'text', :multiple=>'false')
              t.acronym(:type=>'text')
              t.rec_id(:type=>'hidden', :value=>'')
              t.role(:type=>'text')
            }
        end
        
        return builder.doc
    
    end
    
    
  
end