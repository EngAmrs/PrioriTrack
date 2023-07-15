class Task < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user

  before_save :add_hours_to_dates
  private

  def add_hours_to_dates
    self.startAt += 3.hours if startAt.present? and self.status == false
    self.endAt += 3.hours if endAt.present? and self.status == false
  end
end
