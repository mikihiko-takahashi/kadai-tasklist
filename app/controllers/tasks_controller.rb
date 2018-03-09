class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :show, :update]
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "メッセージを投稿しました。"
      redirect_to root_url
    else
      @tasks = current_user.tasks.order("created_at desc").page(params[:page])
      render "toppages/index"
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "メッセージを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  def edit
  end
  
  def show
  end
  

  def update
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end      

  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_path
    end
  end
  
end
