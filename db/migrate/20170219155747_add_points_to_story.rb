class AddPointsToStory < ActiveRecord::Migration
  def change
    add_column :stories, :points, :integer
  end
end
