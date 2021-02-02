class HomeworksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  before_action :set_chat
  before_action :set_students, only:[:new, :create]
  before_action :set_professionals, only:[:new, :create]

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = Homework.all
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
  end

  # GET /homeworks/new
  def new
    @homework = Homework.new
  end

  # GET /homeworks/1/edit
  def edit
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = current_user.homeworks.new(homework_params)
    @homework.chat = @chat
    @homework.receiver_id = @chat.user_id
    @homework.documents.attach(params[:homework][:my_documents])
    respond_to do |format|
      if @homework.save
        format.html { redirect_to @homework.chat, notice: 'Homework was successfully created.' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    if params[:status] == "1"
      @homework.accepted!
    elsif params[:status] == "0"
      @homework.rejected!
      @homework.chat.rejected!
    end

    respond_to do |format|
        format.html { redirect_to @homework.chat, notice: 'Homework was successfully updated.' }
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def homework_params
      params.require(:homework).permit(:chat_id, :user_id, :receiver_id, :status, :my_documents)
    end

    def set_chat
      @chat = Chat.find(params[:chat_id])
    end

    def set_professionals
      @professionals = User.where(rol: "professional")
    end

    def set_students
      @students = User.where(rol: "student")
    end
    
end
