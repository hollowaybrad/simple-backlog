class Summary
  attr_reader :total_points, :assigned_stories, :unassigned_stories,
    :total_stories, :complete_stories, :assigned_stories_points, :unassigned_stories_points

  def initialize(stories)
    @complete_stories = stories.find_all{|story| story.complete == true}
    incomplete_stories = stories.find_all{|story| story.complete == false}

    @assigned_stories = incomplete_stories.find_all{|story| story.user != nil}
    @assigned_stories_points = @assigned_stories.collect{|story| story.points}.sum

    @unassigned_stories = incomplete_stories.find_all{|story| story.user == nil}
    @unassigned_stories_points = @unassigned_stories.collect{|story| story.points}.sum

    @total_points = stories.collect{|story| story.points}.sum
    @total_stories = stories.size
  end

end
