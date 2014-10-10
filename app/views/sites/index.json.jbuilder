json.array!(@sites) do |site|
  json.extract! site, :id, :server_name, :server_location, :ip, :repository, :domain, :dns, :email, :notes, :checklist_complete, :deployed
  json.url site_url(site, format: :json)
end
