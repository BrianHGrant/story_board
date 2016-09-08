class ContributionsController < ApplicationController

  def new
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new
    @rss = Urss.at("http://www.flikr.com/services/feeds/photos_public.gne?format=rss_200"); true
    @rss_url = @rss.entries.first.medias.first.content_url
  end

  def create
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new(contribution_params)
    if @contribution.save
      redirect_to story_path(@contribution.story)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:story_id])
    @contribution = Contribution.find(params[:id])
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
  def contribution_params
    params.require(:contribution).permit(:image_url, :username, :content)
  end

end
