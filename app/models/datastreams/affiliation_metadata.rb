class AffiliationMetadata < ActiveFedora::OmDatastream

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
         xml.rec_class
      }
  
  
    end
    
    return builder.doc
    
  end
  
  
  def self.xml_form
      
      builder = Nokogiri::XML::Builder.new do |t|
        

         t.affiliation{
             
         
              t.rec_id(:type=>'text', :value=>'', :label=>'Identifier', :display=>'public')
              t.name(:type=>'text', :multiple=>'false', :label=>'Affiliation', :display=>'public')
              t.acronym(:type=>'text', :label=>'Acronym', :display=>'public')
              t.role(:type=>'text', :label=>'Role', :display=>'public')
             
              t.rec_class(:type=>'hidden', :value=>'Affiliation', :display=>'public')
          
          }
       
    end
    
    return builder.doc
    
  end
  
end