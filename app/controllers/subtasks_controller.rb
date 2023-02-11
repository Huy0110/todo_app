class SubtasksController < ApplicationController
  before_action :set_subtask, only: %i[ show edit update destroy ]

  # GET /subtasks or /subtasks.json
  def index
    @subtasks = Subtask.all
  end

  # GET /subtasks/1 or /subtasks/1.json
  def show
    @list = List.find(params[:list_id])
    @subtask = @list.subtasks.find(params[:id])
  end

  # GET /subtasks/new
  def new
    @list = List.find(params[:list_id])
    @subtask = @list.subtasks.new
  end

  # GET /subtasks/1/edit
  def edit
    @list = List.find(params[:list_id])
    @subtask = @list.subtasks.find(params[:id])
  end

  # POST /subtasks or /subtasks.json
  def create
    @list = List.find(params[:list_id])
    @subtask = @list.subtasks.new(subtask_params)

    respond_to do |format|
      if @subtask.save
        format.html { redirect_to list_path(@list), notice: "Subtask was successfully created." }
        format.json { render :show, status: :created, location: @subtask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtasks/1 or /subtasks/1.json
  def update
    @list = List.find(params[:list_id])
    @subtask = @list.subtasks.find(params[:id])
    respond_to do |format|
      if @subtask.update(subtask_params)
        format.html { redirect_to list_path(@list), notice: "Subtask was successfully updated." }
        format.json { render :show, status: :ok, location: @subtask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtasks/1 or /subtasks/1.json
  def destroy
    @list = List.find(params[:list_id])
    @subtask = @list.subtasks.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to list_url(@list), notice: "Subtask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_subtask
      @subtask = Subtask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subtask_params
      params.require(:subtask).permit(:description, :completed, :list_id)
    end
end
