class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :sis_id, type: String
  field :university, type: String
  field :course_code, type: String
  field :initial_active, type: Mongoid::Boolean
  field :initial_answered, type: Mongoid::Boolean
  field :midterm_active, type: Mongoid::Boolean
  field :midterm_answered, type: Mongoid::Boolean
  field :exit_active, type: Mongoid::Boolean
  field :exit_answered, type: Mongoid::Boolean
end
