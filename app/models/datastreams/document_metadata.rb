class DocumentMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "metadatas")
    t.title(index_as: :stored_searchable)
    t.author(index_as: :stored_searchable)
    t.researchPhase(index_as: :stored_searchable)
    t.tree_path(index_as: :stored_searchable)
  end
  
  

  def self.xml_template
      builder = Nokogiri::XML::Builder.new do |xml|
    
      xml.metadatas {
         xml.title
         xml.author
         xml.researchPhase
         xml.tree_path
      }
  
  
    end
    
    return builder.doc
    
    
    
    
    
  end
end