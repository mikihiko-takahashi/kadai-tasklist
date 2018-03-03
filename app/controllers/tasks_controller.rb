class TasksController < ApplicationController
#  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

#  def index
#    @tasks = Task.order(created_at: :desc).page(params[:page])
#    @tasks = Task.all.page(params[:page])
#  end

#  def show
#  end

#  def new
#    @task = Task.new
#  end

  def create
#    @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'task が正常に投稿されました'
#      redirect_to @task
      redirect_to root_url
    else
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'task が投稿されませんでした'
#      render :new
#      render 'tasks/index'
       render 'toppages/index'
    end
  end

#  def edit
#  end

#  def update
#    if @task.update(task_params)
#      flash[:success] = 'Task は正常に更新されました'
#      redirect_to @task
#    else
#      flash.now[:danger] = 'Task は更新されませんでした'
#      render :edit
#    end
#  end

  def destroy
    @task.destroy

    flash[:success] = 'task は正常に削除されました'
#    redirect_to tasks_url
    redirect_back(fallback_location: root_path)
  end

  private

#  def set_task
#    @task = task.find(params[:id])
#  end


  def task_params
    params.require(:task).permit(:content, :status)
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end

end
