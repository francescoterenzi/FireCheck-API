class CompaniesController < ApplicationController
  
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.all
    json_response(@companies)
  end

  # POST /companies
  def create
    @company = Company.create!(company_params)
    json_response(@company, :created)
  end

  # GET /companies/:id
  def show
    json_response(@company)
  end

  # PUT /companies/:id
  def update
    @company.update(company_params)
    head :no_content
  end
  
  # DELETE /companies/:id
  def destroy
    @company.destroy
    head :no_content
  end

  #GET /search/companies
  def search
    @parameter = search_params
    @companies = Company.all.where(
      "lower(name) LIKE :q", q: "%#{@parameter}%")
      
    res = {
      "total_count" => @companies.size,
      "companies" => @companies
    } 

    json_response(res)

  end

  private

  def search_params
    params.require(:q)
  end

  def company_params
    # whitelist params
    params.permit(:id, :name, :address)
  end

  def set_company
    @company = Company.find(params[:id])
  end

end

