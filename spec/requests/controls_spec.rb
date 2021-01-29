require 'rails_helper'

RSpec.describe 'Controls API', type: :request do

    # initialize test data
    let!(:extinguisher) { create(:extinguisher) }
    let!(:controls) { create_list(:control, 10, extinguisher_id: extinguisher.id) }
    let(:control_id) { controls.first.id }

    # Test suite for GET /controls
    describe 'GET /controls' do
        # make HTTP get request before each example
        before { get '/controls' }

        it 'returns controls' do
            # Note `json` is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for PUT /controls/:id
    # describe 'PUT /controls/:id' do
    #     let(:valid_attributes) { { name: 'Comet' } }

    #     context 'when the record exists' do
    #         before { put "/controls/#{control_id}", params: valid_attributes }

    #         it 'updates the record' do
    #         expect(response.body).to be_empty
    #         end

    #         it 'returns status code 204' do
    #         expect(response).to have_http_status(204)
    #         end
    #     end
    # end

end