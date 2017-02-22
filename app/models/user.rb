class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true

  has_many :stories
  has_many :projects, through: :stories

  def full_name
    first_name + " " + last_name
  end
end
