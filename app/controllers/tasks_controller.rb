class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ update destroy ]

  # POST /tasks or /tasks.json
  def create
    params[:task][:name].strip!
    @task = Task.new(task_params)
  
    respond_to do |format|
      if @task.save
        format.html { redirect_to webapp_path, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { redirect_to webapp_path, alert: "Failed to create task." }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
      @task.update(task_params)
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to webapp_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name,:seconds,:endAt,:startAt, :status, :project_id).merge(user_id: current_user.id)

    end
end
