class FreezersController < ApplicationController
  # GET /freezers
  # GET /freezers.json
  def index
    @freezers = Freezer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @freezers }
    end
  end

  # GET /freezers/1
  # GET /freezers/1.json
  def show
    @freezer = Freezer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @freezer }
    end
  end

  # GET /freezers/new
  # GET /freezers/new.json
  def new
    @freezer = Freezer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @freezer }
    end
  end

  # GET /freezers/1/edit
  def edit
    @freezer = Freezer.find(params[:id])
  end

  # POST /freezers
  # POST /freezers.json
  def create
    @freezer = Freezer.new(params[:freezer])

    respond_to do |format|
      if @freezer.save
        format.html { redirect_to @freezer, notice: 'Freezer was successfully created.' }
        format.json { render json: @freezer, status: :created, location: @freezer }
      else
        format.html { render action: "new" }
        format.json { render json: @freezer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /freezers/1
  # PUT /freezers/1.json
  def update
    @freezer = Freezer.find(params[:id])

    respond_to do |format|
      if @freezer.update_attributes(params[:freezer])
        format.html { redirect_to @freezer, notice: 'Freezer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @freezer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /freezers/1
  # DELETE /freezers/1.json
  def destroy
    @freezer = Freezer.find(params[:id])
    @freezer.destroy

    respond_to do |format|
      format.html { redirect_to freezers_url }
      format.json { head :ok }
    end
  end
end
