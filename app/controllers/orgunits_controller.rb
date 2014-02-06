class OrgunitsController < ApplicationController
  before_action :set_orgunit, only: [:show, :edit, :update, :destroy]

  # GET /orgunits
  # GET /orgunits.json
  def index
    @orgunits = Orgunit.all
  end

  # GET /orgunits/1
  # GET /orgunits/1.json
  def show
  end

  # GET /orgunits/new
  def new
    @orgunit = Orgunit.new
  end

  # GET /orgunits/1/edit
  def edit
  end

  # POST /orgunits
  # POST /orgunits.json
  def create
    @orgunit = Orgunit.new(orgunit_params)

    respond_to do |format|
      if @orgunit.save
        format.html { redirect_to @orgunit, notice: 'Orgunit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @orgunit }
      else
        format.html { render action: 'new' }
        format.json { render json: @orgunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orgunits/1
  # PATCH/PUT /orgunits/1.json
  def update
    respond_to do |format|
      if @orgunit.update(orgunit_params)
        format.html { redirect_to @orgunit, notice: 'Orgunit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @orgunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgunits/1
  # DELETE /orgunits/1.json
  def destroy
    @orgunit.destroy
    respond_to do |format|
      format.html { redirect_to orgunits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orgunit
      @orgunit = Orgunit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orgunit_params
      params[:orgunit]
    end
end
