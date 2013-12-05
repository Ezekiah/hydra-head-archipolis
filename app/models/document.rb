require 'datastreams/document_metadata'

class Document < ActiveFedora::Base
  has_metadata 'descMetadata', type: DocumentMetadata

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false
  has_attributes :researchPhase, datastream: 'descMetadata', multiple: false
  
  belongs_to :study, :property=> :is_part_of
end
