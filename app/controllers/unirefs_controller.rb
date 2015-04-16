class UnirefsController < ApplicationController
  before_action :set_uniref, only: [:show, :edit, :update, :destroy]

  # GET /unirefs
  # GET /unirefs.json
  def index
    @unirefs = Uniref.all
  end

  # GET /unirefs/1
  # GET /unirefs/1.json
  def show
  end

  # GET /unirefs/new
  def new
    @uniref = Uniref.new
  end

  # GET /unirefs/1/edit
  def edit
  end

  # POST /unirefs
  # POST /unirefs.json
  def create
    @uniref = Uniref.new(uniref_params)

    respond_to do |format|
      if @uniref.save
        format.html { redirect_to @uniref, notice: 'Uniref was successfully created.' }
        format.json { render :show, status: :created, location: @uniref }
      else
        format.html { render :new }
        format.json { render json: @uniref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unirefs/1
  # PATCH/PUT /unirefs/1.json
  def update
    respond_to do |format|
      if @uniref.update(uniref_params)
        format.html { redirect_to @uniref, notice: 'Uniref was successfully updated.' }
        format.json { render :show, status: :ok, location: @uniref }
      else
        format.html { render :edit }
        format.json { render json: @uniref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unirefs/1
  # DELETE /unirefs/1.json
  def destroy
    @uniref.destroy
    respond_to do |format|
      format.html { redirect_to unirefs_url, notice: 'Uniref was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uniref
      @uniref = Uniref.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uniref_params
      params.require(:uniref).permit(:shortname)
    end
end
