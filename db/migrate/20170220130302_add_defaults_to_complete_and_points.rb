class AddDefaultsToCompleteAndPoints < ActiveRecord::Migration
  def change
    change_column_default :stories, :complete, false
    change_column_default :stories, :points, 0
  end
end
