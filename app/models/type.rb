require 'datastreams/type_metadata'

class Type < ActiveFedora::Base
  has_many :entries, :property=>:is_part_of, :class_name=>"Entry"
  
  has_metadata 'descMetadata', type:TypeMetadata
  
  has_attributes :title, datastream: 'descMetadata', multiple: false
  
  def get_entries
  	
  	self.entries.each do |e|
  		{
  		'rec_id'=>e.rec_id,
		'label_en'=>e.label_en,
		'label_fr'=>e.label_fr,
		'value_ddi'=>e.value_ddi,
		'deprecated'=>e.deprecated,
		'default'=>e.default,
		'major'=>e.major,
		
		'value_iso639_1'=>e.value_iso639_1,
		'value_iso639_2t'=>e.value_iso639_2t,
		'value_iso639_2b'=>e.value_iso639_2b,
		'value_iso639_3'=>e.value_iso639_3,
  		}
  		
  	end
  end
  
end
