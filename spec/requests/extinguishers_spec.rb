require 'rails_helper'

RSpec.describe 'Extinguishers API' do
  # initialize test data
  let!(:extinguishers) { create_list(:extinguisher, 10) }
  let(:extinguisher_id) { extinguishers.first.id }

  # Test suite for GET /extinguishers
  describe 'GET /extinguishers' do
    # make HTTP get request before each example
    before { get '/extinguishers' }

    it 'returns extinguishers' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /extinguishers/:id
  describe 'GET /extinguishers/:id' do
    before { get "/extinguishers/#{extinguisher_id}" }

    context 'when the record exists' do
      it 'returns the extinguisher' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(extinguisher_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:extinguisher_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Extinguisher/)
      end
    end
  end

  # Test suite for POST /extinguishers
  describe 'POST /extinguishers' do
    # valid payload
    let(:valid_attributes) { { matricola: '0123456789' } }

    context 'when the request is valid' do
      before { post '/extinguishers', params: valid_attributes }

      it 'creates a extinguisher' do
        expect(json['matricola']).to eq('0123456789')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/extinguishers', params: { matricola: nil } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Matricola can't be blank/)
      end
    end
  end

  # Test suite for PUT /extinguishers/:id
  describe 'PUT /extinguishers/:id' do
    let(:valid_attributes) { { company_id: '1' } }

    context 'when the record exists' do
      before { put "/extinguishers/#{extinguisher_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /extinguishers/:id
  describe 'DELETE /extinguishers/:id' do
    before { delete "/extinguishers/#{extinguisher_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end