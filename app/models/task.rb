class Task < ApplicationRecord
  belongs_to :project
  acts_as_list scope: :project
  validates :title, presence: true, length: { maximum: 255 }
  validates :date, presence: true
  validate :future_date

  def change_position(position)
    self.move_higher if position == 'up'
    self.move_lower if position == 'down'
  end

  def completed?
    !completed_at.blank?
  end

  def future_date
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
