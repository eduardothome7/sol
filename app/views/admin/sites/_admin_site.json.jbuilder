json.extract! admin_site, :id, :title, :logo, :cnpj, :created_at, :updated_at
json.url admin_site_url(admin_site, format: :json)
