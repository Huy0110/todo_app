class ListCommentsController < ApplicationController
  before_action :set_list_comment, only: %i[ show edit update destroy ]

  # GET /list_comments or /list_comments.json
  def index
    @list_comments = ListComment.all
  end

  # GET /list_comments/1 or /list_comments/1.json
  def show
  end

  # GET /list_comments/new
  def new
    @list_comment = ListComment.new
  end

  # GET /list_comments/1/edit
  def edit
  end

  # POST /list_comments or /list_comments.json
  def create
    @list_comment = ListComment.new(list_comment_params)
    @list_comment.user_id = current_user.id
    respond_to do |format|
      if @list_comment.save
        url = "/lists/" + @list_comment.list_id.to_s
        format.html { redirect_to list_comment_url(@list_comment), notice: "List comment was successfully created." }
        format.json { render :show, status: :created, location: @list_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_comments/1 or /list_comments/1.json
  def update
    respond_to do |format|
      if @list_comment.update(list_comment_params)
        format.html { redirect_to list_comment_url(@list_comment), notice: "List comment was successfully updated." }
        format.json { render :show, status: :ok, location: @list_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_comments/1 or /list_comments/1.json
  def destroy
    @list_comment.destroy

    respond_to do |format|
      format.html { redirect_to list_comments_url, notice: "List comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_comment
      @list_comment = ListComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_comment_params
      params.require(:list_comment).permit(:user_id, :list_id, :comment)
    end
end
