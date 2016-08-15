class TasksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_task
  before_action :authenticate_user!
  before_action :set_task, except: [:create, :change_priority]
  
  
  def new
    @task = Task.new
  end
  def edit
    @tasks = Task.find(params[:id])
    redirect_to root_path unless @tasks.id == current_user.id
   rescue ActiveRecordNotFound
    redirect_to root_path
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
        format.html { redirect_to root_path}
      else
        format.html { render action: 'edit'}
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
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

    render nothing: true
  end


  private
  def invalid_task
    logger.error "attemt to access invalid task #{params[:id]}"
    redirect_to root_url, notice: "Invalid task"
  end
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :completed_at, :priority, :list_id, :deadline)
  end

  def correct_user
    if (@user ==! current_user)
      redirect_to root_url
    else
      @tasks = Task.find(params[:id])
       end 
    end

end
