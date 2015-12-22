json.array!(@events) do |event|
  json.extract! event, :id, :name, :image, :address, :event_date
  json.url event_url(event, format: :json)
end
