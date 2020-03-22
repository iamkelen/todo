class Project < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
end
