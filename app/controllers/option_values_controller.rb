class OptionValuesController < ApplicationController
  
  before_filter :get_asset

  # GET /option_values
  # GET /option_values.json
  def index
    @option_values = @option.option_values

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @option_values }
    end
  end

  # GET /option_values/new
  # GET /option_values/new.json
  def new
    @option_value = @option.option_values.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @option_value }
    end
  end

  # POST /option_values
  # POST /option_values.json
  def create
    @option_value = @option.option_values.new(params[:option_value])

    respond_to do |format|
      if @option_value.save
        format.html { redirect_to asset_option_option_values_url(@asset, @option), notice: 'Option value was successfully created.' }
        format.json { render json: @option_value, status: :created, location: @option_value }
      else
        format.html { render action: "new" }
        format.json { render json: @option_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /option_values/1
  # DELETE /option_values/1.json
  def destroy
    @option_value = @option.option_values.find(params[:id])
    @option_value.destroy

    respond_to do |format|
      format.html { redirect_to asset_option_option_values_url(@asset, @option) }
      format.json { head :no_content }
    end
  end

  private
  
  def get_asset
    @asset = Asset.find(params[:asset_id])
    @option = @asset.options.find(params[:option_id])
  end
  
end
