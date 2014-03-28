class Type < ActiveFedora::Base
  has_many :type_entries, :property=>:is_part_of, :class_name=>"Type_entry"
end
