if @pandemic
  json.code :success
  json.data do
    json.extract!(@pandemic, :id, :name, :description, :created_at, :updated_at)
    json.data_urls(@pandemic.data_urls) do |data_url|
      json.id data_url.id
      json.name data_url.source_name
      json.url data_url.source_url
      json.data_type data_url.data_type
      json.created_at data_url.created_at
    end
  end
else
  json.code :error
  json.message 'Error'
end
