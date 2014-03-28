class Type_entry < ActiveFedora::Base
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  has_attributes :label_en, datastream: 'descMetadata', multiple: false
  has_attributes :label_fr, datastream: 'descMetadata', multiple: false
end
