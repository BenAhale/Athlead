json.extract! conversation, :id, :scout_id, :athlete_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
