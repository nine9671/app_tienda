class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @brands = Brand.all.pluck(:name, :id)
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @brands = Brand.all.pluck(:name, :id)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        flash[:success] = "Product was sucessfully created."
        format.html { redirect_to @product}
        format.json { render :show, status: :created, location: @product }
      else
        flash[:danger] = "Product wasn't added to system."
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        flash[:warning] = 'Product was successfully updated.'
        format.html { redirect_to @product }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      flash[:danger] = "Product selected was deleted... "
      format.html { redirect_to products_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :image, :avaibility, :value, :offer_value, :dcto, :offer,  :material, :model, :brand_id,  :availability)
  end
end
