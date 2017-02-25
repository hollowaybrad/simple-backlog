class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /project/:id/stories
  def index
    @project = Project.find(params[:project_id])
    @story = Story.new
    @stories = Story.includes(:user, :labels).where(project_id: @project.id)
  end

  # GET /project/:id/stories/1
  def show
  end

  # GET /project/:id/stories/new
  def new
    @story = Story.new
  end

  # GET /project/:id/stories/1/edit
  def edit
  end

  # POST /project/:id/stories
  def create
    @story = Story.new(story_params)
    @story.project_id = params["project_id"]

    respond_to do |format|
      if @story.save
        format.html { redirect_to project_stories_path(@story.project_id), notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
        format.js { redirect_to project_stories_path(@story.project_id) }
      else
        format.html { redirect_to project_stories_path(params[:project_id]), alert: "Error creating new story"}
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project/:id/stories/1
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to project_stories_path(@story.project_id), notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project/:id/stories/1
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to project_stories_path(@story.project_id), notice: 'Story was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :description, :complete, :project_id, :user_id, :label, :points)
    end
end
