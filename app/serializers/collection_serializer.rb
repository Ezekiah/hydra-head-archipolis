class CollectionSerializer < ActiveModel::Serializer
  attributes :name, :type
  
  has_many collections
end
