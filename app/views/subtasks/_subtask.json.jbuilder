json.extract! subtask, :id, :description, :completed, :list_id, :created_at, :updated_at
json.url subtask_url(subtask, format: :json)
