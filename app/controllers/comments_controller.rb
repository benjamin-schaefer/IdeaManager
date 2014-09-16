class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Idea.find(params[:idea_id]).comments
  end

  # GET ideas/1/comments/1
  # GET ideas/1/comments/1.json
  def show    
  end

  # GET ideas/1/comments/new
  def new
    @comment = current_idea.comments.new(user: current_user)
  end

  # GET ideas/1/comments/1/edit
  def edit
  end

  # POST ideas/1/comments
  # POST ideas/1/comments.json
  def create
    @comment = current_idea.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.idea, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment.idea }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT ideas/1/comments/1
  # PATCH/PUT ideas/1/comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.idea, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment.idea }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE ideas/1/comments/1
  # DELETE ideas/1/comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = current_idea.comments.find(params[:id])
    end

    def current_idea
      @idea ||= Idea.find(params[:idea_id]) #method cashing: hole idea vom Parameter oder, wenn vorhanden, nimm die vorhandene idea
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end

end
