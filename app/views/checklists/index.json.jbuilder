json.array!(@checklists) do |checklist|
  json.extract! checklist, :id, :analytics, :permalinks, :contact_forms, :site_url, :allow_robots, :css_compressed, :javascript_compressed, :redirects, :google_site_map, :site_id
  json.url checklist_url(checklist, format: :json)
end
