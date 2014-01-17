class StudyMetadata < ActiveFedora::OmDatastream
  

  set_terminology do |t|
      
      t.root(path: "metadatas")
      
      
      t.depositor

      t.copyright_holder
      t.software
      t.editor
      t.edition_first_date
      t.edition_last_date
      t.distributor
      t.project
      t.author
      
      
      t.rec_id
      t.title
      t.name
      t.documents_count
      t.archive_extent
      t.archive_location
      t.access_conditions
      
      
    
      t.contact
      t.data_collection_modes
      t.data_collection_context
      t.data_collection_method
      t.data_collection_sampling
      t.data_collection_time_dimension
      t.publication
      t.description
      t.analysis_type
      t.analysis_anonymization
      t.keyword
      
      
      t.classification
      t.observation_unit
      t.data_collection_date_begin
      t.data_collection_date_end
      t.documents_type
      t.analysis_transcription
      t.coverage_spatial_geographic
      t.coverage_spatial_units
      t.coverage_spatial_country
      t.coverage_temporal_begin
      t.coverage_temporal_end
      t.target_group
      t.location_of_units_of_observation
      t.data_language
      t.documentation_language
    
    
    
      t.documents_date_begin
      t.documents_date_end
      t.media_file
      t.documents_transc_count
      t.interviewer
      t.archive_completeness
      t.archive_arrangement_level
      t.archive_consentement
      t.archive_agreememt
      t.note
          
    

  end
  
  

  def self.xml_template
    
    
    builder = Nokogiri::XML::Builder.new do |t|
    
    t.metadatas {

      t.depositor
      
      
      t.copyright_holder
      t.software
      t.editor
      t.edition_first_date
      t.edition_last_date
      t.distributor
      t.project
      t.author
      
      
      t.rec_id
      t.title
      t.documents_count
      t.archive_extent
      t.archive_location
      t.access_conditions
      
      
    
      t.contact
      t.data_collection_modes
      t.data_collection_context
      t.data_collection_method
      t.data_collection_sampling
      t.data_collection_time_dimension
      t.publication
      t.description
      t.analysis_type
      t.analysis_anonymization
      t.keyword
      
      
      t.classification
      t.observation_unit
      t.data_collection_date_begin
      t.data_collection_date_end
      t.documents_type
      t.analysis_transcription
      t.coverage_spatial_geographic
      t.coverage_spatial_units
      t.coverage_spatial_country
      t.coverage_temporal_begin
      t.coverage_temporal_end
      t.target_group
      t.location_of_units_of_observation
      t.data_language
      t.documentation_language
    
    
    
      t.documents_date_begin
      t.documents_date_end
      t.media_file
      t.documents_transc_count
      t.interviewer
      t.archive_completeness
      t.archive_arrangement_level
      t.archive_consentement
      t.archive_agreememt
      t.note
    }
    end
    
    return builder.doc
    
  end
  
  
  
  
  
end
