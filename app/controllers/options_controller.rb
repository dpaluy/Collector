class OptionsController < ApplicationController
  
  before_filter :get_asset
  
  # GET /options
  # GET /options.json
  def index
    @options = @asset.options.order(:expiration, :strike).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asset.options.order(:expiration, :strike) }
    end
  end

  # GET /options/1
  # GET /options/1.json
  def show
    @option = @asset.options.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @option }
    end
  end

  # GET /options/new
  # GET /options/new.json
  def new
    @option = @asset.options.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @option }
    end
  end

  # GET /options/1/edit
  def edit
    @option = @asset.options.find(params[:id])
  end

  # POST /options
  # POST /options.json
  def create
    @option = @asset.options.new(params[:option])

    respond_to do |format|
      if @option.save
        format.html { redirect_to [@asset, @option], notice: 'Option was successfully created.' }
        format.json { render json: @option, status: :created, location: @option }
      else
        format.html { render action: "new" }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /options/1
  # PUT /options/1.json
  def update
    @option = @asset.options.find(params[:id])

    respond_to do |format|
      if @option.update_attributes(params[:option])
        format.html { redirect_to [@asset, @option], notice: 'Option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option = @asset.options.find(params[:id])
    @option.destroy

    respond_to do |format|
      format.html { redirect_to asset_options_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_asset
    @asset = Asset.find(params[:asset_id])
  end
end
