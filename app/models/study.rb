class Study < ActiveFedora::Base
  has_metadata 'descMetadata', type: StudyMetadata

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false
  has_many :documents, :property=> :is_part_of
end
