class ValuesController < ApplicationController
  
  before_filter :get_asset
  
  # GET /values
  # GET /values.json
  def index
    @values = @asset.values.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @values }
    end
  end

  # GET /values/new
  # GET /values/new.json
  def new
    @value = @asset.values.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @value }
    end
  end

  # POST /values
  # POST /values.json
  def create
    @value = @asset.values.new(params[:value])

    respond_to do |format|
      if @value.save
        format.html { redirect_to asset_values_url, notice: 'Value was successfully created.' }
        format.json { render json: @value, status: :created, location: @value }
      else
        format.html { render action: "new" }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1
  # DELETE /values/1.json
  def destroy
    @value = @asset.values.find(params[:id])
    @value.destroy

    respond_to do |format|
      format.html { redirect_to asset_values_url }
      format.json { head :no_content }
    end
  end

  private
  
  def get_asset
    @asset = Asset.find(params[:asset_id])
  end
  
end
