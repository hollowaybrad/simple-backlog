json.extract! story, :id, :title, :description, :complete, :project_id, :user_id, :label, :created_at, :updated_at
json.url story_url(story, format: :json)