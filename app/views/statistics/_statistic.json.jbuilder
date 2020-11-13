json.extract! statistic, :id, :position, :height, :weight, :points, :rebounds, :assists, :steals, :blocks, :created_at, :updated_at
json.url statistic_url(statistic, format: :json)
