class Task < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 50  }
  before_save :add_hours_to_dates
  before_create :initTime

  # ElasticSearch
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.env, base_class.to_s.pluralize.underscore].join('_')
  searchkick text_middle: [:name]

  private

  def add_hours_to_dates
    self.startAt += 3.hours if startAt.present? and self.status == false
    self.endAt += 3.hours if endAt.present? and self.status == false
  end

  def initTime
    self.startAt = (DateTime.now() + 3.hours)
    self.endAt = (DateTime.now() + 3.hours)
  end
end