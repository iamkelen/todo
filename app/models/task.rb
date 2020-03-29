class Task < ApplicationRecord
  belongs_to :project
  validates :title, presence: true, length: { maximum: 255 }
  validates :date, presence: true
  validate :future_date

  def future_date
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def task_status
    status ? 'Done' : 'Not completed'
  end
end
