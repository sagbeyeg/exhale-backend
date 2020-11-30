class TasksController < ApplicationController

    def create
        @task = Task.create(journal_params)
        if @journal.valid?
          render json: { task: TaskSerializer.new(@task)}, status: :created
        else
          render json: { error: 'failed to create task' }, status: :not_acceptable
        end
      end

 private 

    def tasks_params
        params.require(:task).permit(:title, :status, :content, :user_id)
      end
    end
end


