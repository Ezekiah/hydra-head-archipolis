require 'datastreams/type_entry_metadata'

class Type_entry < ActiveFedora::Base
  has_metadata 'descMetadata', type:TypeEntryMetadata
  
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  has_attributes :label_en, datastream: 'descMetadata', multiple: false
  has_attributes :label_fr, datastream: 'descMetadata', multiple: false
  has_attributes :value_ddi, datastream: 'descMetadata', multiple: false
  
  has_attributes :deprecated, datastream: 'descMetadata', multiple: false
  has_attributes :default, datastream: 'descMetadata', multiple: false
  has_attributes "value_iso639-1", datastream: 'descMetadata', multiple: false
  has_attributes "value_iso639-2t", datastream: 'descMetadata', multiple: false
  has_attributes "value_iso639-2b", datastream: 'descMetadata', multiple: false
  has_attributes "value_iso639-3", datastream: 'descMetadata', multiple: false
  

end
