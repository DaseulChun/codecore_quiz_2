class ReviewsController < ApplicationController

  before_action :authenticated_user!
  
  def create
    @idea = Idea.find params[:idea_id]
    @review = Review.new review_params
    @review.idea = @idea
    @review.user = current_user

    if @review.save
      redirect_to idea_path(@idea)
      flash[:notice] = "Review successfully created!"
    else
      @reviews = @idea.reviews.order(created_at: :desc)
      render :'ideas/show'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @idea = @review.idea

    if can? :crud, @review
      @review.destroy
      redirect_to idea_path(@idea), notice: "Review Deleted"
    else
      redirect_to root_path, alert: "Not Authorized"
    end
  end

  private 

  def review_params
    params.require(:review).permit(:body)
  end
end
