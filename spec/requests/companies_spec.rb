require 'rails_helper'

RSpec.describe 'Companies API', type: :request do
  # initialize test data
  let!(:companies) { create_list(:company, 10) }
  let(:company_id) { companies.first.id }

  # Test suite for GET /companies
  describe 'GET /companies' do
    # make HTTP get request before each example
    before { get '/companies' }

    it 'returns companies' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /companies/:id
  describe 'GET /companies/:id' do
    before { get "/companies/#{company_id}" }

    context 'when the record exists' do
      it 'returns the company' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(company_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:company_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Company/)
      end
    end
  end

  # Test suite for POST /companies
  describe 'POST /companies' do
    # valid payload
    let(:valid_attributes) { { name: 'Fireless' } }

    context 'when the request is valid' do
      before { post '/companies', params: valid_attributes }

      it 'creates a company' do
        expect(json['name']).to eq('Fireless')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/companies', params: { name: nil } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /companies/:id
  describe 'PUT /companies/:id' do
    let(:valid_attributes) { { name: 'Comet' } }

    context 'when the record exists' do
      before { put "/companies/#{company_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /companies/:id
  describe 'DELETE /companies/:id' do
    before { delete "/companies/#{company_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end