class Task < ApplicationRecord
  belongs_to :project
  has_one :user, through: :project
  default_scope -> {order(duedate: :asc)}
  validates :project_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :duedate, presence: true
  validates :completed, :inclusion => { :in => ["true", "false"] }
end
