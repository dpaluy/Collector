class VolatilitiesController < ApplicationController
  # GET /volatilities
  # GET /volatilities.json
  def index
    @volatilities = Volatility.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volatilities }
    end
  end

  # GET /volatilities/1
  # GET /volatilities/1.json
  def show
    @volatility = Volatility.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volatility }
    end
  end

  # GET /volatilities/new
  # GET /volatilities/new.json
  def new
    @volatility = Volatility.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volatility }
    end
  end

  # GET /volatilities/1/edit
  def edit
    @volatility = Volatility.find(params[:id])
  end

  # POST /volatilities
  # POST /volatilities.json
  def create
    @volatility = Volatility.new(params[:volatility])

    respond_to do |format|
      if @volatility.save
        format.html { redirect_to @volatility, notice: 'Volatility was successfully created.' }
        format.json { render json: @volatility, status: :created, location: @volatility }
      else
        format.html { render action: "new" }
        format.json { render json: @volatility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volatilities/1
  # PUT /volatilities/1.json
  def update
    @volatility = Volatility.find(params[:id])

    respond_to do |format|
      if @volatility.update_attributes(params[:volatility])
        format.html { redirect_to @volatility, notice: 'Volatility was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @volatility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volatilities/1
  # DELETE /volatilities/1.json
  def destroy
    @volatility = Volatility.find(params[:id])
    @volatility.destroy

    respond_to do |format|
      format.html { redirect_to volatilities_url }
      format.json { head :no_content }
    end
  end
end
