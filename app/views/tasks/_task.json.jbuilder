json.extract! task, :id, :title, :decription, :start_date, :end_date, :story_point, :priority, :due_date, :status, :task_type, :created_at, :updated_at
json.url task_url(task, format: :json)
