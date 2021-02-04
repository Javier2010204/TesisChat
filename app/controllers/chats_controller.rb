class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.where(user_id: current_user.id)
    @professional_chats = Chat.where(professional_id: current_user.id)
    @admin_chats = Chat.all
  end

  def reported
    @reported_chats = Chat.where(status: "report")
  end
  

  # GET /chats/1
  # GET /chats/1.json
  def show
    @message = Message.new
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    if params[:status] == "1"
      @chat.accepted!
    elsif params[:status] == "0"
       @chat.reported!
    end

    respond_to do |format|
        format.html { redirect_to @chat, notice: 'Chat reportado con exito, sera revisado por los administradores' }
        format.json { render :show, status: :ok, location: @job_application }
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:user_id, :professional_id, :status)
    end
end
