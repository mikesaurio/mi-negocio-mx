json.array!(@inspection_lines) do |inspection_line|
  json.extract! inspection_line, :id, :inspection, :line
  json.url dependency_url(inspection_line, format: :json)
end
