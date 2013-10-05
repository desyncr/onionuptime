class OnionsController < ApplicationController
  before_action :set_onion, only: [:show, :edit, :update, :destroy]

  # GET /onions
  # GET /onions.json
  def index
    @onions = Onion.all
  end

  # GET /onions/1
  # GET /onions/1.json
  def show
  end

  # GET /onions/new
  def new
    @onion = Onion.new
  end

  # GET /onions/1/edit
  def edit
  end

  # POST /onions
  # POST /onions.json
  def create
    @onion = Onion.new(onion_params)

    respond_to do |format|
      if @onion.save
        format.html { redirect_to @onion, notice: 'Onion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @onion }
      else
        format.html { render action: 'new' }
        format.json { render json: @onion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onions/1
  # PATCH/PUT /onions/1.json
  def update
    respond_to do |format|
      if @onion.update(onion_params)
        format.html { redirect_to @onion, notice: 'Onion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @onion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onions/1
  # DELETE /onions/1.json
  def destroy
    @onion.destroy
    respond_to do |format|
      format.html { redirect_to onions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onion
      @onion = Onion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def onion_params
      params.require(:onion).permit(:title, :name, :url, :description)
    end
end
