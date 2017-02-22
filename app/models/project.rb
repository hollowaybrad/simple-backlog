class Project < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :stories, dependent: :destroy
  has_many :users, through: :stories
end
