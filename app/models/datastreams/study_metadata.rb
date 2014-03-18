#encoding:utf-8

class StudyMetadata < ActiveFedora::OmDatastream

    
      
    set_terminology do |t|
        
        t.root(path: "metadatas")
              
              
        t.depositors
        
        t.copyright_holders
        t.softwares
        t.editors
        t.edition_first_date
        t.edition_last_date
        t.distributors
        t.projects
        t.authors
        
        t.rec_id
        t.title
        t.name
        t.documents_count
        t.archive_extent
        t.archive_location
        t.access_conditions
        
        t.contacts
        t.data_collection_modes
        t.data_collection_context
        t.data_collection_methods
        t.data_collection_samplings
        t.data_collection_time_dimensions
        
        t.publications
        t.descriptions
        t.disciplines
          
        t.analysis_types
        t.analysis_anonymization
        t.analysis_transcription
          
        t.keywords
          
        t.classifications
        t.observation_units
        t.data_collection_date_begin
        t.data_collection_date_end
        
        t.coverage_spatial_geographics
        t.coverage_spatial_units
        t.coverage_spatial_countries
        t.coverage_temporal_begin
        t.coverage_temporal_end
        t.target_groups
        t.location_of_units_of_observations
        t.data_languages
        t.documentation_languages
        
        t.documents_date_begin
        t.documents_date_end
        t.media_files
        t.documents_transc_count
        t.interviewers
        t.archive_completeness
          
        t.archive_arrangement_level
        t.archive_arrangement_level_description
        t.archive_preservation_level_description
        t.archive_preservation_level
          
        t.archive_consentement
        t.archive_agreememt
        t.notes
          
        t.data_collection_documents_types
        t.data_collection_extent
        
        t.data_collection_has_media
        
        t.analysis_has_transcription
        t.archive_accessed
        
        t.publication_citation
        t.documents_types
        t.rec_delete
        
        
      
    end
  
    def self.xml_template
        
        Nokogiri::XML.parse("<metadatas/>")
        
    end
  


  
  
  
  
  
end
