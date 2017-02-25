require 'summary'

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @project = Project.new
  end

  # GET /projects/1
  # GET /projects/1.json
  def show

    user_id = params[:user_id]

    if user_id && user_id != ""
      @stories = Story.by_project_and_user(@project.id, user_id) 
      @user_id = user_id
    else
      @stories = Story.by_project(@project.id) 
    end
    
    if @stories
      @summary = Summary.new

      complete_stories = @stories.find_all{|story| story.complete == true}
      incomplete_stories = @stories.find_all{|story| story.complete == false}

      @summary.assigned_stories = incomplete_stories.find_all{|story| story.user != nil}
      @summary.unassigned_stories = incomplete_stories.find_all{|story| story.user == nil}
      @summary.total_points = @stories.collect{|story| story.points}.sum
      @summary.total_stories = @stories.size
      @summary.total_complete = complete_stories.size
      @summary.complete_stories = complete_stories
    end
    
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
