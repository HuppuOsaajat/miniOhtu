require_relative '../scripts/bibtex_generator'

class BibrefsController < ApplicationController
  include BibtexGenerator
  include ACMUtils

  before_action :set_bibref, only: [:show, :edit, :update, :destroy, :bibtex]

  # GET /bibrefs
  # GET /bibrefs.json
  def index
    @bibrefs = Bibref.all
  end

  # GET /bibrefs/1
  # GET /bibrefs/1.json
  def show
  end

  # GET /bibrefs/new
  def new
    @bibref = Bibref.new
  end

  def new_from_acm_get
    @bibref = Bibref.new
  end

  def new_from_acm_post
    @bibref = get_bibref_from_acm_url(params_acm_url)
    @bibref.generate_shortname

    respond_to do |format|
      if @bibref.save
        format.html { redirect_to @bibref, notice: 'Reference successfully imported from ACM!' }
      else
        format.html { render :new_from_acm_get, notice: 'There was an error importing the reference!' }
      end
    end
  end

  # GET /bibrefs/1/edit
  def edit
  end

  # POST /bibrefs
  # POST /bibrefs.json
  def create
    @bibref = Bibref.new(bibref_params)


    respond_to do |format|
      if @bibref.save
        format.html { redirect_to edit_bibref_path(@bibref), notice: 'Reference was successfully created.' }
        format.json { render :show, status: :created, location: @bibref }
      else
        format.html { render :new }
        format.json { render json: @bibref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibrefs/1
  # PATCH/PUT /bibrefs/1.json
  def update
    respond_to do |format|
      if @bibref.update_all(bibref_params, params.require(:bibref).require(:fields_attributes))
        @bibref.generate_shortname
        format.html { redirect_to @bibref, notice: 'Reference was successfully updated.' }
        format.json { render :show, status: :ok, location: @bibref }
      else
        format.html { render :edit, notice: 'An error prevented the reference from being updated!' }
        format.json { render json: @bibref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibrefs/1
  # DELETE /bibrefs/1.json
  def destroy
    @bibref.destroy
    respond_to do |format|
      format.html { redirect_to bibrefs_url, notice: 'Reference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # GET /bibrefs/1/bibtex
  def bibtex
    @bibref_bibtex = generate_bibtex(@bibref)
  end

  # GET /bibrefs/bibtex_list
  def bibtex_list
    @bibrefs_bibtex = generate_all_bibtex
  end

  # GET /bibrefs/download
  def download
    send_data generate_all_bibtex, filename: 'references.bib'
  end

  # GET /bibrefs/search
  # POST /bibrefs/search
  def search
    case request.method_symbol
      when :get
        search_get
      when :post
        search_post
    end
  end

  def new_from_acm

    case request.method_symbol
      when :get
        new_from_acm_get
      when :post
        new_from_acm_post
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bibref
    @bibref = Bibref.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bibref_params
    params.require(:bibref).permit(:shortname, :reftype)
  end


  def params_acm_url
    @url = params.permit(:url)[:url]
  end


  def search_get
    @results = nil
  end

  def search_post
    @query = params.permit(:query)[:query]
    @results = Bibref.search_results(@query)
  end
end
