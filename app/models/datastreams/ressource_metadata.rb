#For stocking the tree of all folders and files of the study


class RessourceMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "metadatas")
    
    t.checksum
    t.checksum_type
    t.content_date
    t.description
    
    t.digital_origin
    t.dissemination
    t.file
    t.file_name
    t.file_name_original
    t.file_size
    t.format_compression
    t.format_compression_ratio
    t.format_encodage
    t.format_mimetype
    t.format_pronom
    t.format_structure
    t.format_structure_type
    t.format_version
    t.language
    t.note
    t.order
    t.processing_software_name
    t.rec_created_date

    t.rec_id
    t.rec_modified_date
    t.rec_type
    t.subject_country
    t.subject_topic
    t.title
    t.url
    
  end
  
  

  def self.xml_template
    
    
    builder = Nokogiri::XML::Builder.new do |t|
    
      t.metadatas{
        
        t.checksum
        t.checksum_type
        t.content_date
        t.description
        
        t.digital_origin
        t.dissemination
        t.file
        t.file_name
        t.file_name_original
        t.file_size
        t.format_compression
        t.format_compression_ratio
        t.format_encodage
        t.format_mimetype
        t.format_pronom
        t.format_structure
        t.format_structure_type
        t.format_version
        t.language
        t.note
        t.order
        t.processing_software_name
        t.rec_created_date
    
        t.rec_id
        t.rec_modified_date
        t.rec_type
        t.subject_country
        t.subject_topic
        t.title
        t.url

      }
    end
    
    return builder.doc
    
  end
  

  
   
  
  
  
end