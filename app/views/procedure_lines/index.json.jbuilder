json.array!(@procedure_lines) do |procedure_line|
  json.extract! procedure_line, :id, :procedure, :line
  json.url procedure_line_url(procedure_line, format: :json)
end
