class IdeasController < ApplicationController
  load_and_authorize_resource

  # GET /ideas
  # GET /ideas.json
  def index
    @current_ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @current_idea = Idea.new
  end
    
  # GET /ideas/1/edit
  def edit
  end
  # POST /ideas
  # POST /ideas.json
  def create
    @current_idea = Idea.new(idea_params)
    current_idea.user_id = current_user.id

    respond_to do |format|
      if current_idea.save
        format.html { redirect_to current_idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: current_idea }
      else
        format.html { render :new }
        format.json { render json: current_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if current_idea.update(idea_params)
        format.html { redirect_to current_idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: current_idea }
      else
        format.html { render :edit }
        format.json { render json: current_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    current_idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def current_idea
      @current_idea ||= Idea.find(params[:id])
    end
    helper_method :current_idea

    def current_ideas
      @current_ideas ||= Idea.all
    end
    helper_method :current_ideas

    def current_comments
      @current_comments = current_idea.comments.all
    end
    helper_method :current_comments


    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:user_name, :name, :description, :picture)
    end

end
