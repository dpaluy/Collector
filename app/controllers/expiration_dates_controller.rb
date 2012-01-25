class ExpirationDatesController < ApplicationController
  # GET /expiration_dates
  # GET /expiration_dates.json
  def index
    @expiration_dates = ExpirationDate.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expiration_dates }
    end
  end

  # GET /expiration_dates/new
  # GET /expiration_dates/new.json
  def new
    @expiration_date = ExpirationDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expiration_date }
    end
  end

  # POST /expiration_dates
  # POST /expiration_dates.json
  def create
    @expiration_date = ExpirationDate.new(params[:expiration_date])

    respond_to do |format|
      if @expiration_date.save
        format.html { redirect_to expiration_dates_url, notice: 'Expiration date was successfully created.' }
        format.json { render json: @expiration_date, status: :created, location: @expiration_date }
      else
        format.html { render action: "new" }
        format.json { render json: @expiration_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expiration_dates/1
  # DELETE /expiration_dates/1.json
  def destroy
    @expiration_date = ExpirationDate.find(params[:id])
    @expiration_date.destroy

    respond_to do |format|
      format.html { redirect_to expiration_dates_url }
      format.json { head :no_content }
    end
  end
end
