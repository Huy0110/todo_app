json.extract! list_comment, :id, :user_id, :list_id, :comment, :created_at, :updated_at
json.url list_comment_url(list_comment, format: :json)
