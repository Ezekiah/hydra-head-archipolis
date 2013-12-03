class StudyMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "fields")
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
    Nokogiri::XML.parse("<fields/>")
  end
end
