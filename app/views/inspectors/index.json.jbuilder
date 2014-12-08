json.array!(@inspectors) do |inspector|
  json.extract! inspector, :id, :nombre, :vigencia, :materia, :supervisor, :contacto, :foto, :dependency
  json.url inspector_url(inspector, format: :json)
end
