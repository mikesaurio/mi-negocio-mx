json.array!(@lines) do |line|
  json.extract! line, :id, :nombre, :descripcion
  json.url line_url(line, format: :json)
end
