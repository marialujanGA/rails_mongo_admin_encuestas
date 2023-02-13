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

  validates :email, presence: true, uniqueness: { scope: :course_code, case_sensitive: false }
  validates :sis_id, presence: true, uniqueness: { scope: :course_code, case_sensitive: false }
  validates :course_code, presence: true, uniqueness: { scope: :sis_id, case_sensitive: false }

  FILTER_PARAMS = %i[sis_id column direction].freeze

  scope :by_sis_id, ->(query) { where('users.sis_id ilike ?', "%#{query}%") } 

  # def self.filter(filters)
  #   User.includes(:course_code)
  #         .by_name(filters['sis_id'])
  #         .order("#{filters['column']} #{filters['direction']}")
  # end
end
