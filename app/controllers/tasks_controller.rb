class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  #同じものをまとめる
  
  def index
    @tasks = Task.all
  end
  
  def show
    #set_task
    #@task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスクが作成されました。'
      redirect_to @task
    else
      flash.now[:dabger] = 'タスクが作成されません。'
    end
  end
  
  def edit
    #set_task
    #@task = Task.find(params[:id])
  end
  
  def update
    #set_task
    #@task = Task.find(params[:id])

  if @task.update(task_params)
    flash[:success] = 'タスクが編集されました'
    redirect_to @task
  else
    flash.now[:danger] = 'タスクが編集されませんでした'
    render :new
  end
  end
  
  def destroy
    #set_task
    #@task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクは削除されました'
    redirect_to tasks_url
  end
end

private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:content, :status)
end
