class StudyMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
      t.root(path: "metadatas")
      t.title(index_as: :stored_searchable)
      t.author(index_as: :stored_searchable)
      t.langdoc(index_as: :stored_searchable)
      t.locationofunitsofobservation
      t.abstract
      t.general
      t.affiliation
      t.keywords
      t.copyright
      t.discipline
      t.methodofdatacollection
      t.contact
      t.actor
      t.targetgroups
      t.collsitu
      t.accessconditions
      t.relpubl
      t.colldate
      t.anonymization
      t.corpus
      t.authenty
      t.sampprocedure
      t.distrbtr
      t.description
      t.topicclassification
      t.nation
      t.timedimension
      t.modedatacollection
      t.numberofunits
      t.studydates
      t.timeperiodcovered
      t.spatialunits
      t.datakind
      t.weighting
      t.edition
      t.universe
      t.numberoffiles
      t.locarch
      t.analysis
      t.methode 
      t.grantno
      t.idno
      t.observunits
      t.langdata
      t.editor
      t.geogcover
      t.transcription
      t.firstedition
      t.fundag
      t.latestedition
      t.software
    
  end
  
  

  def self.xml_template
    
    builder = Nokogiri::XML::Builder.new do |xml|
    
    xml.metadatas {
       xml.title
       xml.author
       xml.langdoc
       xml.locationofunitsofobservation
       xml.abstract
       xml.general
       xml.affiliation
       xml.keywords
       xml.copyright
       xml.discipline
       xml.methodofdatacollection
       xml.contact
       xml.actor
       xml.targetgroups
       xml.collsitu
       xml.accessconditions
       xml.relpubl
       xml.colldate
       xml.anonymization
       xml.corpus
       xml.authenty
       xml.sampprocedure
       xml.distrbtr
       xml.description
       xml.topicclassification
       xml.nation
       xml.timedimension
       xml.modedatacollection
       xml.numberofunits
       xml.studydates
       xml.timeperiodcovered
       xml.spatialunits
       xml.datakind
       xml.weighting
       xml.edition
       xml.universe
       xml.numberoffiles
       xml.locarch
       xml.analysis
       xml.methode
       xml.grantno
       xml.idno
       xml.observunits
       xml.langdata
       xml.editor
       xml.geogcover
       xml.transcription
       xml.firstedition
       xml.fundag
       xml.latestedition
       xml.software
    }
    end
    
    return builder.to_xml
    
  end
  
  
  
  def self.generate_form
    xml = self.xml_template
    metadatas   = xml.xpath("//metadata")
    
  end
  
  
  
  
  
  
end
