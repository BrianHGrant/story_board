class CommentsController < ApplicationController

  def new
    @story = Story.find(params[:story_id])
    if params[:contribution_id] == nil
      @comment = @story.comments.new
    else
      @contribution = Contribution.find(params[:contribution_id])
      @comment = @contribution.comments.new
    end
  end

  def create
    @story = Story.find(params[:story_id])
    if params[:contribution_id] == nil
      @comment = @story.comments.new(comment_params)
      if @comment.save
        redirect_to story_path(@story)
      else
        render :new
      end
    else
      @contribution = Contribution.find(params[:contribution_id])
      @comment = @contribution.comments.new(comment_params)
      if @comment.save
        redirect_to story_contribution_path(@story, @contribution, @comment)
      else
        render :new
      end
    end

  end

  def edit
    @story = Story.find(params[:story_id])
    @contribution = Contribution.find(params[:id])
  end

  def update
    @story = Story.find(params[:story_id])
    @contribution= Contribution.find(params[:id])
    if @contribution.update(contribution_params)
      redirect_to story_contribution_path(@story, @contribution)
    else
      render :edit
    end
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to story_path(@contribution.story)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :username)
  end

end
