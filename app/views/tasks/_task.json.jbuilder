json.extract! task, :id, :name, :startAt, :EndAt, :status, :projrct_id, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
