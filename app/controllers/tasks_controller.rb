class TasksController < ApplicationController
  before_action :find_task, except: [:create]
  
  def show
    render json: @task
  end

  def create
    @task = Task.create(task_params)
    if @task.valid?
      render json: { task: TaskSerializer.new(@task)}, status: :created
    else
      render json: { error: 'failed to create task' }, status: :not_acceptable
    end
  end

  def update
    @task.update(task_params)
    render json: @task
  end

  def destroy
    @task.destroy
  end
  
  private 
  
  def find_task
    @task = Task.find(params[:id])
  end

  def tasks_params
      params.require(:task).permit(:title, :status, :content, :user_id)
    end
  end
end


