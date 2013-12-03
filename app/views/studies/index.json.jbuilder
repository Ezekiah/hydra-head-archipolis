json.array!(@studies) do |study|
  json.extract! study, :title, :author
  json.url study_url(study, format: :json)
end
