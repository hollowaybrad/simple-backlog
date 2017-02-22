class CreateJoinTableStoryLabel < ActiveRecord::Migration
  def change
    create_join_table :stories, :labels do |t|
      t.index :story_id
      t.index :label_id
    end
  end
end
