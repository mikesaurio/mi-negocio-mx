json.array!(@dependencies) do |dependency|
  json.extract! dependency, :id, :nombre ,:municipio
  json.url dependency_url(dependency, format: :json)
end

