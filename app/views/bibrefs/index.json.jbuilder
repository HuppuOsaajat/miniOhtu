json.array!(@bibrefs) do |bibref|
  json.extract! bibref, :id, :shortname
  json.url bibref_url(bibref, format: :json)
end
