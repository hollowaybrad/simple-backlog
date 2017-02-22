class Summary
  attr_accessor :total_points, :assigned_stories, :unassigned_stories, :total_stories, :total_complete

  def assigned_stories_points
    assigned_stories.collect{|story| story.points}.sum
  end

  def unassigned_stories_points
    unassigned_stories.collect{|story| story.points}.sum
  end
end