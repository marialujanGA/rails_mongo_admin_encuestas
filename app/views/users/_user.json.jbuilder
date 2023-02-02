json.extract! user, :id, :name, :email, :sis_id, :university, :course_code, :initial_active, :initial_answered, :midterm_active, :midterm_answered, :exit_active, :exit_answered, :created_at, :updated_at
json.url user_url(user, format: :json)
