class TasksController < ApplicationController

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

  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def change_priority
    params[:task].each_with_index do |id, i|
      Task.update_all({priority: i+1}, {id: id})
    end
    render head :ok
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to root_path, notice: "Task completed"
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
