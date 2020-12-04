class Api::V1::TasksController < ApplicationController
  before_action :find_task, except: [:create, :index]

    def index 
      @tasks = Task.all
      render json: @tasks 
    end 

    def show
      render json: @task
    end
  
    def create
      # byebug
      @task = Task.create(tasks_params)
      if @task.valid?
        render json: { task: TaskSerializer.new(@task)}
      else
        render json: { error: 'failed to create task' }
      end
    end
  
    def update
      @task.update(tasks_params)
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
      params.permit(:title, :status, :content, :user_id)
    end

end
