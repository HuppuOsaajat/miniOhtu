json.array!(@unirefs) do |uniref|
  json.extract! uniref, :id, :shortname
  json.url uniref_url(uniref, format: :json)
end
