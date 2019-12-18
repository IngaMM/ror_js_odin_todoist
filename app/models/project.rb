class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  default_scope -> {order(title: :asc)}
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }, uniqueness: { scope: :user_id }
  validates :color, presence: true
end
