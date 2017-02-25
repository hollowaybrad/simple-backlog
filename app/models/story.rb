class Story < ActiveRecord::Base
  validates :title, :project, presence: true

  belongs_to :project
  belongs_to :user
  has_and_belongs_to_many :labels

  scope :by_project, -> (project_id) { includes(:user).where("project_id = ?", project_id) }
  scope :by_project_and_user, -> (project_id, user_id) { by_project(project_id).where("user_id = ?", user_id) }
end
