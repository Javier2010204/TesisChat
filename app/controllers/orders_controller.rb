class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_chat

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(order_params)
    @order.chat = @chat

    if current_user.rol == "student"
      @order.receiver_id = @chat.professional_id
    else
      @order.receiver_id = @chat.user_id
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order.chat, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    if params[:status] == "1"
      @order.accepted!
   elsif params[:status] == "0"
       @order.rejected!
   end

    respond_to do |format|
        format.html { redirect_to @order.chat, notice: 'Orden aceptada con exito' }
        format.json { render :show, status: :ok, location: @job_application }
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_chat
      @chat = Chat.find(params[:chat_id])      
    end
    

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :receiver_id, :chat_id, :date, :body, :status, :number_page)
    end
end
