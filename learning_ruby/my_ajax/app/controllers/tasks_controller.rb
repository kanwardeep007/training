class TasksController < ApplicationController
  def index
    @tasks = Task.all  
    @complete_tasks = Task.where(completed: true)
    @incomplete_tasks = Task.where(completed: false)

  end
  def new
    @task = Task.new(task: "")
  end
  def create
    @task = Task.new(params_permitted)
    if @task.save
      @complete_tasks = Task.where(completed: true)
      @incomplete_tasks = Task.where(completed: false)
    else
      render 'new'
    end
  end

  def complete
    # do something
    
    unless params[:task_ids].blank?
      params[:task_ids].each do |task_id|
        t = Task.find(task_id)
        t.update(completed: true)
        end
    end
    @complete_tasks = Task.where(completed: true)
    @incomplete_tasks = Task.where(completed: false)
    render 'index'
  end

  def incomplete
    debugger
    unless params[:task_ids].blank?
      params[:task_ids].each do |task_id|
        t = Task.find(task_id)
        t.update(completed: false)
      end
    end
    @complete_tasks = Task.where(completed: true)
    @incomplete_tasks = Task.where(completed: false)
    render 'index'
  end

  private
  
  def params_permitted
    params.require(:task).permit(:task)
  end
end
