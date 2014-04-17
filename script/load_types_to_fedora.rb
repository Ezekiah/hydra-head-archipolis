include Hydra::ModelMethods

##IMPORT ALL ARCHIPOLIS TYPES TO FEDORA
$LOAD_PATH << './script'
require 'types'
require 'languages'

types = {'data_collection_documents'=>TYPE_data_collection_documents,
  'speaker_role'=>TYPE_speaker_role,
  'analysis_types'=>TYPE_analysis_types,
  'analysis_anonymization'=>TYPE_analysis_anonymization,
  'analysis_has_transcription'=>TYPE_analysis_has_transcription,
  'archive_agreement'=>TYPE_archive_agreememt, 
  'archive_accessed'=>TYPE_archive_accessed, 
  'data_collection_has_media'=>TYPE_data_collection_has_media, 
  'interviewers_unknown'=>TYPE_interviewers_unknown, 
  'data_collection_methods'=>TYPE_data_collection_methods, 
  'location_of_units_of_observations'=>TYPE_location_of_units_of_obser, 
  'data_collection_modes'=>TYPE_data_collection_modes, 
  'data_collection_time_dimensions'=>TYPE_data_collection_time_dimen, 
  'archive_arrangement_level'=>TYPE_archive_arrangement_level, 
  'archive_consentement'=>TYPE_archive_consentement, 
  'archive_preservation_level' => TYPE_archive_preservation_level,
  'identifiers'=>TYPE_identifiers
  #'languages'=>TYPE_languages
  
  }


types.each do |key,value|
  
  #create type in fedora
  type = Type.find(:title=>key)[0]
  
  puts 'processing type : '+key
  
  if type.blank?
    new_type = Type.create(:title=>key)
  
    value.each do |row|
      new_type.entries << Entry.create(row)
    end
    
 
    
  end
  
  
  
  
  
  
  
  

end







