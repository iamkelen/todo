class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  validates :title, presence: true, length: { maximum: 100 }
  accepts_nested_attributes_for :tasks
end
