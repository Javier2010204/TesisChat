class HomeworkReviewsController < ApplicationController
  before_action :set_homework_review, only: [:show, :edit, :update, :destroy]

  # GET /homework_reviews
  # GET /homework_reviews.json
  def index
    @homework_reviews = HomeworkReview.all
  end

  # GET /homework_reviews/1
  # GET /homework_reviews/1.json
  def show
  end

  # GET /homework_reviews/new
  def new
    @homework_review = HomeworkReview.new
  end

  # GET /homework_reviews/1/edit
  def edit
  end

  # POST /homework_reviews
  # POST /homework_reviews.json
  def create
    @homework_review = HomeworkReview.new(homework_review_params)

    respond_to do |format|
      if @homework_review.save
        format.html { redirect_to @homework_review, notice: 'Homework review was successfully created.' }
        format.json { render :show, status: :created, location: @homework_review }
      else
        format.html { render :new }
        format.json { render json: @homework_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homework_reviews/1
  # PATCH/PUT /homework_reviews/1.json
  def update
    respond_to do |format|
      if @homework_review.update(homework_review_params)
        format.html { redirect_to @homework_review, notice: 'Homework review was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework_review }
      else
        format.html { render :edit }
        format.json { render json: @homework_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homework_reviews/1
  # DELETE /homework_reviews/1.json
  def destroy
    @homework_review.destroy
    respond_to do |format|
      format.html { redirect_to homework_reviews_url, notice: 'Homework review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework_review
      @homework_review = HomeworkReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def homework_review_params
      params.require(:homework_review).permit(:status, :editor_id, :homework_id)
    end
end
