json.array!(@orgunits) do |orgunit|
  json.extract! orgunit, :id
  json.url orgunit_url(orgunit, format: :json)
end
