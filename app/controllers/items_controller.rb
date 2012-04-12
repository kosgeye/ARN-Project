class ItemsController < ApplicationController
$items = []
layout 'application'
  # GET /items
  # GET /items.json
  def index
	@items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
  
  def index3
	@items = Item.find_all_by_freezer_id(params[:item][:freezer_id])
	

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items}
    end
  end
  def index2
  @items = Item.find(params[:item_ids])
  
  @items.each do |item|
  item.sold = true
  item.save
  end
  
  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items}
    end
  end
  def sell
  @found = Item.find_by_weight(params[:weight])
  if(params.has_key?(:item) && !@found.nil?)
  @found= Item.find_by_product_id_and_weight(params[:item][:product_id], params[:weight])
  
  $items.push(@found)
  else
  flash[:notice] = "Enter description and weight to search for item!"
  end
  
  
  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: $items}
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    
    @item = Item.find(params[:id])
	@product = @item.product

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :ok }
    end
  end
end
