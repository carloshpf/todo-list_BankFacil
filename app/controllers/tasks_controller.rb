class TasksController < ApplicationController

  def index
    @task = Task.new
    @tasks = Task.ordered_by_pending
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to tasks_path, notice: "Tarefa adicionada!"
    else
      redirect_to tasks_path, alert: @task.errors.full_messages.to_sentence
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to tasks_path, notice: "Tarefa atualizada!"
    else
      render :edit
    end
  end

  def remove
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Tarefa removida!"
  end

  def toggle
    task_ids = Hash.new {|h,k| h[k] = []}
    params[:tasks].reduce(task_ids) do |buffer, (id, status)|
      buffer[status] << id
      buffer
    end
    Task.update_all({status: "pending"}, {id: task_ids["pending"]})
    Task.update_all({status: "done"}, {id: task_ids["done"]})
    redirect_to tasks_path, notice: "Tarefas atualizadas com sucesso!"
  end
end
