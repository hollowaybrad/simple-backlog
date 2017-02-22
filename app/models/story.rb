class Story < ActiveRecord::Base
  validates :title, :project, presence: true

  belongs_to :project
  belongs_to :user
  has_and_belongs_to_many :labels
end
