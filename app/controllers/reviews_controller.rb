class ReviewsController < ApplicationController
  def create
    @idea = Idea.find params[:idea_id]
    @review = Review.new review_params
    @review.idea = @idea

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
    @review.destroy
    redirect_to idea_path(@idea), notice: "Review Deleted"
  end

  private 

  def review_params
    params.require(:review).permit(:body)
  end
end
