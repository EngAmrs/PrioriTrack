class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :title, presence: true, length: { minimum: 3, maximum: 50  }
  before_destroy :remove_project_id_from_tasks

  private
  def remove_project_id_from_tasks
    tasks.update_all(project_id: nil)
  end
end
