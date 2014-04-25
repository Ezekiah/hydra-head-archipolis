#encoding:utf-8

class StudyMetadata < ActiveFedora::OmDatastream

    
      
    set_terminology do |t|
        
        t.root(path: "metadatas")
              
              
        t.depositors
        
        t.copyright_holders(index_as: :stored_searchable)
        t.softwares(index_as: :stored_searchable)
        t.editors(index_as: :stored_searchable)
        t.edition_first_date(index_as: :stored_searchable)
        t.edition_last_date(index_as: :stored_searchable)
        t.distributors(index_as: :stored_searchable)
        t.projects(index_as: :stored_searchable)
        t.authors(index_as: :stored_searchable)
        
        t.rec_id(index_as: :stored_searchable)
        t.title(index_as: :stored_searchable)
        t.name(index_as: :stored_searchable)
        t.documents_count(index_as: :stored_searchable)
        t.archive_extent(index_as: :stored_searchable)
        t.archive_location(index_as: :stored_searchable)
        t.access_conditions(index_as: :stored_searchable)
        
        t.contacts(index_as: :stored_searchable)
        t.data_collection_modes(index_as: :stored_searchable)
        t.data_collection_context(index_as: :stored_searchable)
        t.data_collection_methods(index_as: :stored_searchable)
        t.data_collection_samplings(index_as: :stored_searchable)
        t.data_collection_time_dimensions(index_as: :stored_searchable)
        
        t.publications(index_as: :stored_searchable)
        t.descriptions(index_as: :stored_searchable)
        t.disciplines(index_as: :stored_searchable)
          
        t.analysis_types(index_as: :stored_searchable)
        t.analysis_anonymization(index_as: :stored_searchable)
        t.analysis_transcription(index_as: :stored_searchable)
          
        t.keywords(index_as: :stored_searchable)
          
        t.classifications(index_as: :stored_searchable)
        t.observation_units(index_as: :stored_searchable)
        t.data_collection_date_begin(index_as: :stored_searchable)
        t.data_collection_date_end(index_as: :stored_searchable)
        
        t.coverage_spatial_geographics(index_as: :stored_searchable)
        t.coverage_spatial_units(index_as: :stored_searchable)
        t.coverage_spatial_countries(index_as: :stored_searchable)
        t.coverage_temporal_begin(index_as: :stored_searchable)
        t.coverage_temporal_end(index_as: :stored_searchable)
        t.target_groups(index_as: :stored_searchable)
        t.location_of_units_of_observations(index_as: :stored_searchable)
        t.data_languages(index_as: :stored_searchable)
        t.documentation_languages(index_as: :stored_searchable)
        
        t.documents_date_begin(index_as: :stored_searchable)
        t.documents_date_end(index_as: :stored_searchable)
        t.media_files(index_as: :stored_searchable)
        t.documents_transc_count(index_as: :stored_searchable)
        t.interviewers(index_as: :stored_searchable)
        t.archive_completeness(index_as: :stored_searchable)
          
        t.archive_arrangement_level(index_as: :stored_searchable)
        t.archive_arrangement_level_description(index_as: :stored_searchable)
        t.archive_preservation_level_description(index_as: :stored_searchable)
        t.archive_preservation_level(index_as: :stored_searchable)
          
        t.archive_consentement(index_as: :stored_searchable)
        t.archive_agreement(index_as: :stored_searchable)
        t.notes(index_as: :stored_searchable)
          
        t.data_collection_documents_types(index_as: :stored_searchable)
        t.data_collection_extent(index_as: :stored_searchable)
        
        t.data_collection_has_media(index_as: :stored_searchable)
        
        t.analysis_has_transcription(index_as: :stored_searchable)
        t.archive_accessed(index_as: :stored_searchable)
        
        t.publication_citation(index_as: :stored_searchable)
        t.documents_types(index_as: :stored_searchable)
        t.rec_delete
        
        t.contacts_description(index_as: :stored_searchable)
        

    end
  
    def self.xml_template
        
        Nokogiri::XML.parse("<metadatas/>")
        
    end
    
    
  
  
end


class StudyInfos < ActiveFedora::OmDatastream
	set_terminology do |t|
        
        t.root(path: "study_infos")
        
        t.creator(index_as: :stored_searchable)
        t.editors
        t.edited(index_as: :stored_searchable)
        t.rejected(index_as: :stored_searchable)
        t.published(index_as: :stored_searchable)
        t.closed(index_as: :stored_searchable)
        t.served(index_as: :stored_searchable)
        
   end 
end
