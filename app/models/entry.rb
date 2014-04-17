require 'datastreams/entry_metadata'

class Entry < ActiveFedora::Base
  has_metadata 'descMetadata', type:EntryMetadata
  
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  has_attributes :label_en, datastream: 'descMetadata', multiple: false
  has_attributes :label_fr, datastream: 'descMetadata', multiple: false
  has_attributes :value_ddi, datastream: 'descMetadata', multiple: false
  
  has_attributes :deprecated, datastream: 'descMetadata', multiple: false
  has_attributes :default, datastream: 'descMetadata', multiple: false
  has_attributes :value_iso639_1, datastream: 'descMetadata', multiple: false
  has_attributes :major, datastream: 'descMetadata', multiple: false
  
  
  
  has_attributes :value_iso639_2t, datastream: 'descMetadata', multiple: false
  has_attributes :value_iso639_2b, datastream: 'descMetadata', multiple: false
  has_attributes :value_iso639_3, datastream: 'descMetadata', multiple: false
  
  


end
