class TasksController < ApplicationController

  # Affichage des tâches
  def index
    @tasks = Task.all
  end

  # Affichage d'une tâche
  def show
    @task = Task.find(params[:id])
  end

  # Ajout d'une nouvelle tâche
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  # Modification d'une tâche
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  private

  # Utile pour l'ajout d'un tâche
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
