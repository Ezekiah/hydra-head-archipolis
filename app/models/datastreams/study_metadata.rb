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
    
    builder = Nokogiri::XML::Builder.new do |xml|
    
    xml.metadatas {
        xml.metadata {
          xml.name "title"
        }
    
        xml.metadata {
           xml.name "author"
        }
        xml.metadata {
           xml.name "langdoc"
        }
        xml.metadata {
           xml.name "locationofunitsofobservation"
        }
        xml.metadata {
           xml.name "abstract"
        }
        xml.metadata {
           xml.name "general"
        }
        xml.metadata {
           xml.name "affiliation"
        }
        xml.metadata {
           xml.name "keywords"
        }
        xml.metadata {
           xml.name "copyright"
        }
        xml.metadata {
           xml.name "discipline"
        }
        xml.metadata {
           xml.name "methodofdatacollection"
        }
        xml.metadata {
           xml.name "contact"
        }
        xml.metadata {
           xml.name "actor"
        }
        xml.metadata {
           xml.name "targetgroups"
        }
        xml.metadata {
           xml.name "collsitu"
        }
        xml.metadata {
           xml.name "accessconditions"
        }
        xml.metadata {
           xml.name "relpubl"
        }
        xml.metadata {
           xml.name "colldate"
        }
        xml.metadata {
           xml.name "anonymization"
        }
        xml.metadata {
           xml.name "corpus"
        }
        xml.metadata {
           xml.name "authenty"
        }
        xml.metadata {
           xml.name "sampprocedure"
        }
        xml.metadata {
           xml.name "distrbtr"
        }
        xml.metadata {
           xml.name "description"
        }
        xml.metadata {
           xml.name "topicclassification"
        }
        xml.metadata {
           xml.name "nation"
        }
        xml.metadata {
           xml.name "timedimension"
        }
        xml.metadata {
           xml.name "modedatacollection"
        }
        xml.metadata {
           xml.name "numberofunits"
        }
        xml.metadata {
           xml.name "studydates"
        }
        xml.metadata {
           xml.name "timeperiodcovered"
        }
        xml.metadata {
           xml.name "spatialunits"
        }
        xml.datakind {
           xml.name "datakind"
        }
        xml.metadata {
           xml.name "weighting"
        }
        xml.metadata {
           xml.name "edition"
        }
        xml.metadata {
           xml.name "universe"
         }
        xml.metadata {
           xml.name "numberoffiles"
        }
        xml.metadata {
           xml.name "locarch"
        }
        xml.metadata {
           xml.name "analysis"
        }
        xml.metadata {
           xml.name "methode"
        } 
        xml.metadata {
           xml.name "grantno"
        }
        xml.metadata {
           xml.name "idno"
        }
        xml.metadata {
           xml.name "observunits"
        }
        xml.metadata {
           xml.name "langdata"
        }
        xml.metadata {
           xml.name "editor"
        }
        xml.metadata {
           xml.name "geogcover"
        }
        xml.metadata {
           xml.name "transcription"
        }
        xml.metadata {
           xml.name "firstedition"
        }
        xml.metadata {
           xml.name "fundag"
        }
        xml.metadata {
           xml.name "latestedition"
        }
        xml.metadata {
           xml.name "software"
        }
            
    }
    
    
    
    end
    
    return builder.to_xml
    
  end
  
  
  
  def self.generate_form
    xml = self.xml_template
    metadatas = xml.xpath("//metadata")
    
  end
  
  
  
  
  
  
end
