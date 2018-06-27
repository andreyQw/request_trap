json.extract! request, :id, :url_path, :created_at, :updated_at
json.url request_url(request, format: :json)
