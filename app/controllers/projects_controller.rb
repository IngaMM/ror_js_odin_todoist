class ProjectsController < ApplicationController
  def show
    if current_user
      @projects = current_user.projects
    end
    @project = Project.find(params[:id])
    @project_options = @projects.map(&:title)
    @tasks = @project.tasks.where("completed = ?", "false")
    @linkText = "Show all tasks"
    @linkPath = projectall_path
    @alternativeText = "No incomplete tasks"
    @showNoProjectButDueDate = true
  end

  def showAll
    if current_user
      @projects = current_user.projects
    end
    @project = Project.find(params[:id])
    @project_options = [@project.title]
    @tasks = @project.tasks
    @linkText = "Show only incomplete tasks"
    @linkPath = project_path
    @alternativeText = "No tasks"
    @showNoProjectButDueDate = true
    render 'projects/show'
  end

  def create
    @project = current_user.projects.build
    @project.title = params[:title]
    @project.color = params[:color]
    if @project.save
      flash[:notice] = "Project created!"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Project could not be created. The title must not be empty, must be unique and can have up to 20 characters."
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.title = params[:title]
    @project.color = params[:color]
    if @project.save
      flash[:notice] = "Project updated!"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Project could not be updated. The title must not be empty, must be unique and can have up to 20 characters."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project deleted!"
    redirect_to root_path
  end

end
