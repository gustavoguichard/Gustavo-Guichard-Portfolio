class ProjectsController < ApplicationController
  respond_to :html, :json

  # GET /projects
  # GET /projects.json
  def index
    if params[:search].present?
      @projects = Project.search(params[:search]).includes(:tags)
    else
      @projects = Project.order("position").includes(:tags)
    end
    @tags = Tag.all
  end

  def show
    @project = Project.find(params[:id])
    if request.path != project_path(@project)
      redirect_to @project, status: :moved_permanently
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    if !@admin
      redirect_to root_path
    else
      @project = Project.new
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    if @project.save && @admin
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find_by_slug(params[:id])
    @project.update_attributes(params[:project]) if @admin
    respond_with @project
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy if @admin
    redirect_to portfolio_url
  end

  # POST /sort/  
  def sort
    params[:projects].each_with_index do |project, index|
      Project.update_all(['position=?', index+1], ['id=?', project[1]["id"]]) if @admin
    end
    render nothing: true
  end
end
