json.array!(@documents) do |document|
  json.extract! document, :title, :author
  json.url document_url(document, format: :json)
end
