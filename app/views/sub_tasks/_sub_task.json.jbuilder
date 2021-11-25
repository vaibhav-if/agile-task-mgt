json.extract! sub_task, :id, :title, :status, :created_at, :updated_at
json.url sub_task_url(sub_task, format: :json)
