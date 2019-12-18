class TasksController < ApplicationController

  def toggleCompleted
    @task = Task.find(params[:task_id])
    if @task.completed == "true"
      @task.completed = "false"
     else
      @task.completed = "true"
    end
    @task.save
    redirect_back(fallback_location: root_path)
  end

  def create
    @task = Task.new
    @task.title = params[:title]
    @task.project_id = Project.find_by(title: params[:project], user_id: current_user.id).id
    @task.duedate = params[:duedate]
    @task.completed = "false"
    if @task.save
      flash[:notice] = "Task created!"
      redirect_to project_path(:id => @task.project_id)
    else
      flash[:notice] = "Task could not be created. Please fill out all fields. The title can have up to 20 characters."
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.title = params[:title]
    @task.project_id = Project.find_by(title: params[:project], user_id: current_user.id).id
    @task.duedate = params[:duedate]
    if @task.save
      flash[:notice] = "Task updated!"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Task could not be updated. Please fill out all fields. The title can have up to 20 characters."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task deleted!"
    redirect_back(fallback_location: root_path)
  end


end
