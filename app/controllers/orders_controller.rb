class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    property = Property.friendly.find(params[:property_id])
    customer = Stripe::Customer.create({email: params[:stripeEmail], source: params[:stripeToken],})
      # charge = Stripe::Charge.create({
      #   customer: customer.id,
      #   amount: current_cart.sub_total.to_i,
      #   description: 'Rails Stripe customer',
      #   currency: 'usd',   
      # })
    @order = Order.new
    @order.price = property.price
    # @order.customer_id = customer[:id]
    @order.property_id = property.id
    @order.user_id = current_user&.id
    @order.name = current_user.profile.name
    @order.email = current_user.email
    @order.phone_number = current_user.profile.mobile_number
    @order.addresses = current_user.profile.address
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :property_id, :name, :email, :price, :phone_number, :addresses)
    end
end
