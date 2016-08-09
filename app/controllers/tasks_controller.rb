class TasksController < ApplicationController
  before_action :set_task, except: [:create, :change_priority]
  def new
    @task = Task.new
  end

  def index
    @tasks = Task.order("priority")
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path}
      else
      flash[:error] = 'Content can not be blank or Content is to long (maximim is 60 characters)'
        format.html { redirect_to root_path }
      end
    end
  end
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to roo_path}
      else
        format.html { render action: 'edit'}
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to root_path, notice: "Task completed"
  end

  def change_priority
   # byebug
   params[:task].each_with_index do |id, index|
      Task.where(id: id).update_all(priority: index+1)
    end
    #Task.all.each_with_index do |task, i|
     # task.update(priority: params[:task][i].to_i)
    #end

    render nothing: true
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :completed_at, :priority, :list_id)
  end
end
