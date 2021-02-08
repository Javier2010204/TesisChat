class ExtensionOrdersController < ApplicationController
  before_action :set_extension_order, only: [:show, :edit, :update, :destroy]
  before_action :set_order

  # GET /extension_orders
  # GET /extension_orders.json
  def index
    @extension_orders = ExtensionOrder.all
  end

  # GET /extension_orders/1
  # GET /extension_orders/1.json
  def show
  end

  # GET /extension_orders/new
  def new
    @extension_order = ExtensionOrder.new
  end

  # GET /extension_orders/1/edit
  def edit
  end

  # POST /extension_orders
  # POST /extension_orders.json
  def create
    @extension_order = ExtensionOrder.new(extension_order_params)
    @extension_order.order = @order
    @extension_order.user = current_user

    if current_user.rol == "student"
      @extension_order.receiver_id = @order.chat.professional_id
    else
      @extension_order.receiver_id = @order.chat.user_id
    end

    respond_to do |format|
      if @extension_order.save
        format.html { redirect_to @extension_order.order.chat, notice: 'Extension order was successfully created.' }
        format.json { render :show, status: :created, location: @extension_order }
      else
        format.html { render :new }
        format.json { render json: @order, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extension_orders/1
  # PATCH/PUT /extension_orders/1.json
  def update
    if params[:status] == "1"
      @order.update_order_date(@extension_order.extension_date)
      @extension_order.accepted!
      ExtensionOrderMailer.accepted_extension_order(@extension_order).deliver_now
   elsif params[:status] == "0"
      if @extension_order.receiver.rol == "student"
        carrera = @extension_order.receiver.career_id
        profesionales = User.where(rol: "professional").where(career_id: carrera)
        random = User.where(rol: "professional").where(career_id: carrera).order(Arel.sql('RANDOM()')).first
        JobApplication.create(user:@extension_order.receiver,professional: random, status:"pending")
      end
      @order.chat.update(status: "denied")
      @order.update(status:"denied")
      @extension_order.rejected!
   end

    respond_to do |format|
        format.html { redirect_to @order.chat, notice: 'Orden aceptada con exito' }
        format.json { render :show, status: :ok, location: @job_application }
    end
  end

  # DELETE /extension_orders/1
  # DELETE /extension_orders/1.json
  def destroy
    @extension_order.destroy
    respond_to do |format|
      format.html { redirect_to extension_orders_url, notice: 'Extension order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:order_id])
    end

    def set_extension_order
      @extension_order = ExtensionOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def extension_order_params
      params.require(:extension_order).permit(:extension_date, :order_id, :user_id, :receiver_id)
    end
    
end
