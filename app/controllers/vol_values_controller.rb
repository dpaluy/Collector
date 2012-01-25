class VolValuesController < ApplicationController

  before_filter :get_volatility
  
  # GET /vol_values
  # GET /vol_values.json
  def index
    @vol_values = @volatility.vol_values.order(:timestamp).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volatility.vol_values.order(:timestamp) }
    end
  end

  # GET /vol_values/new
  # GET /vol_values/new.json
  def new
    @vol_value = @volatility.vol_values.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vol_value }
    end
  end

  # POST /vol_values
  # POST /vol_values.json
  def create
    @vol_value = @volatility.vol_values.new(params[:vol_value])

    respond_to do |format|
      if @vol_value.save
        format.html { redirect_to volatility_vol_values_path(@volatility), notice: 'Vol value was successfully created.' }
        format.json { render json: @vol_value, status: :created, location: @vol_value }
      else
        format.html { render action: "new" }
        format.json { render json: @vol_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vol_values/1
  # DELETE /vol_values/1.json
  def destroy
    @vol_value = @volatility.vol_values.find(params[:id])
    @vol_value.destroy

    respond_to do |format|
      format.html { redirect_to volatility_vol_values_path(@volatility) }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_volatility
    @volatility = Volatility.find(params[:volatility_id])
  end
end
