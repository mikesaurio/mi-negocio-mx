json.array!(@inspection_requirements) do |inspection_requirement|
  json.extract! inspection_requirement, :id, :inspection, :requirement
  json.url procedure_line_url(inspection_requirement, format: :json)
end
