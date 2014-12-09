json.array!(@lines) do |line|
  json.extract! line, :id, :nombre, :descripcion, :municipio
  json.url line_url(line, format: :json)
end
