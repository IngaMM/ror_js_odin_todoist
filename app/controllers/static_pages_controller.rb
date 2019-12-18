class StaticPagesController < ApplicationController
  def home
    if current_user
      @projects = current_user.projects
      @tasks = current_user.tasks.where("completed = ?", "false").where("dueDate <= ?", Time.now.end_of_day)
      @dates = @tasks.uniq.pluck(:duedate)
      @project_options = @projects.map(&:title)
    end
    @title = "Today"
    @linkText = "Show all tasks"
    @linkPath = todayall_path
    @alternativeText = "No incomplete tasks"
  end

  def todayAll
    if current_user
      @projects = current_user.projects
      @tasks = current_user.tasks.where("dueDate <= ?", Time.now.end_of_day)
      @dates = @tasks.uniq.pluck(:duedate)
      @project_options = @projects.map(&:title)
    end
    @title = "Today"
    @linkText = "Show only incomplete tasks"
    @linkPath = root_path
    @alternativeText = "No tasks"
    render 'static_pages/home'
  end

  def next7days
    if current_user
      @projects = current_user.projects
      @tasks = current_user.tasks.where("completed = ?", "false").where("dueDate <= ?", Time.now.end_of_day + 7.days)
      @dates = @tasks.uniq.pluck(:duedate)
      @project_options = @projects.map(&:title)
    end
    @title = "Next 7 days"
    @linkText = "Show all tasks"
    @linkPath = next7daysall_path
    @alternativeText = "No incomplete tasks"
    render 'static_pages/home'
  end

  def next7daysAll
    if current_user
      @projects = current_user.projects
      @tasks = current_user.tasks.where("dueDate <= ?", Time.now.end_of_day + 7.days)
      @dates = @tasks.uniq.pluck(:duedate)
      @project_options = @projects.map(&:title)
    end
    @title = "Next 7 days"
    @linkText = "Show only incomplete tasks"
    @linkPath = next7days_path
    @alternativeText = "No tasks"
    render 'static_pages/home'
  end
end
