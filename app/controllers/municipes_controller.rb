class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update destroy ]

  # GET /municipes or /municipes.json
  def index

    if params.slice(:name_search, :cpf, :cns_search, :email_search, :mobile_search, :street_search, :zipcode_search, :city_search).values.any?(&:present?)
      conditions = []
      search_terms = []
      
      conditions << "LOWER(name) LIKE ?" if params[:name_search].present?
      search_terms << "%#{params[:name_search].downcase}%" if params[:name_search].present?
    
      conditions << "cpf LIKE ?" if params[:cpf].present?
      search_terms << "%#{params[:cpf]}%" if params[:cpf].present?
    
      conditions << "cns LIKE ?" if params[:cns_search].present?
      search_terms << "%#{params[:cns_search]}%" if params[:cns_search].present?
    
      conditions << "LOWER(email) LIKE ?" if params[:email_search].present?
      search_terms << "%#{params[:email_search].downcase}%" if params[:email_search].present?
    
      conditions << "mobile LIKE ?" if params[:mobile_search].present?
      search_terms << "%#{params[:mobile_search]}%" if params[:mobile_search].present?

      conditions << "addresses.street LIKE ?" if params[:street_search].present?
      search_terms << "%#{params[:street_search]}%" if params[:street_search].present?

      conditions << "addresses.zipcode LIKE ?" if params[:zipcode_search].present?
      search_terms << "%#{params[:zipcode_search]}%" if params[:zipcode_search].present?

      conditions << "addresses.city LIKE ?" if params[:city_search].present?
      search_terms << "%#{params[:city_search]}%" if params[:city_search].present?
    
      if conditions.any?
        @municipes = Municipe.joins(:address).where(conditions.join(' AND '), *search_terms)
      else
        @municipes = Municipe.none
      end
    else
      @municipes = Municipe.all
    end
    
    @municipes = @municipes.paginate(page: params[:page], per_page: 10)
    
  end

  # GET /municipes/1 or /municipes/1.json
  def show
  end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  # GET /municipes/1/edit
  def edit
    @municipe = Municipe.find(params[:id])
    @municipe.build_address unless @municipe.address
  end

  # POST /municipes or /municipes.json
  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipes_path, notice: "Inclusão realizada com sucesso." }
        format.json { render :show, status: :created, location: @municipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update

    puts address_params.inspect

    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipes_path, notice: "Alteração realizada com sucesso." }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipes/1 or /municipes/1.json
  def destroy
    @municipe.destroy!

    respond_to do |format|
      format.html { redirect_to municipes_url, notice: "Municipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def municipe_params
      params.require(:municipe).permit(:name, :cpf, :cns, :email, :country_code, :mobile, :birthday, :status, :photo, address_attributes: [ :id, :zipcode, :street, :complement, :district, :city, :state, :ibge_code, :municipe_id ])
    end

    def address_params
      params.require(:municipe).require(:address_attributes).permit(:id, :zipcode, :street, :complement, :district, :city, :state, :ibge_code)
    end

end



