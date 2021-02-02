class ExtensionsController < ApplicationController
  before_action :set_extension, only: [:show, :edit, :update, :destroy]
  before_action :set_chat

  # GET /extensions
  # GET /extensions.json
  def index
    @extensions = Extension.all
  end

  # GET /extensions/1
  # GET /extensions/1.json
  def show
  end

  # GET /extensions/new
  def new
    @extension = Extension.new
  end

  # GET /extensions/1/edit
  def edit
  end

  # POST /extensions
  # POST /extensions.json
  def create
    @extension = current_user.extensions.new(extension_params)

    @extension.chat = @chat

    if current_user.rol == "student"
      @extension.receiver_id = @chat.professional_id
    else
      @extension.receiver_id = @chat.user_id
    end

    respond_to do |format|
      if @extension.save
        format.html { redirect_to @extension.chat, notice: 'Extension was successfully created.' }
        format.json { render :show, status: :created, location: @extension }
      else
        format.html { render :new }
        format.json { render json: @extension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extensions/1
  # PATCH/PUT /extensions/1.json
  def update
    if params[:status] == "1"
      @extension.accepted!
   elsif params[:status] == "0"
       @extension.rejected!
   end

    respond_to do |format|
        format.html { redirect_to @extension.chat, notice: 'Prorroga aceptada con exito' }
        format.json { render :show, status: :ok, location: @extension }
    end
  end

  # DELETE /extensions/1
  # DELETE /extensions/1.json
  def destroy
    @extension.destroy
    respond_to do |format|
      format.html { redirect_to extensions_url, notice: 'Extension was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extension
      @extension = Extension.find(params[:id])
    end

    def set_chat
      @chat = Chat.find(params[:chat_id])
    end
    

    # Only allow a list of trusted parameters through.
    def extension_params
      params.require(:extension).permit(:user_id, :chat_id, :receiver_id, :status, :date)
    end
end
