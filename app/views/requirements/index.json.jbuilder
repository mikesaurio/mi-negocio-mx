json.array!(@requirements) do |requirement|
  json.extract! requirement, :id, :nombre, :descripcion
  json.url requirement_url(requirement, format: :json)
end
