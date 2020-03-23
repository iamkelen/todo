class Task < ApplicationRecord
  belongs_to :project
  validates :title, presence: true, length: { maximum: 255 }
  validates :date_cannot_be_in_the_past, presence: true

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def task_status
    status ? 'Done' : 'Not completed'
  end
end
