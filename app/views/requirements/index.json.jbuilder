json.array!(@requirements) do |requirement|
  json.extract! requirement, :id, :nombre, :descripcion, :path, :tipo
  json.url requirement_url(requirement, format: :json)
end
