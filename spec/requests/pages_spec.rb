# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Pages API', type: :request do
  # initialize test data 
  let!(:pages) { create_list(:page, 10) }
  let(:page_id) { pages.first.id }
  
  # Test suite for GET /pages
  describe 'GET /pages' do
    # make HTTP get request before each example
    before { get '/pages' }

    it 'returns pages' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /pages/:id
  describe 'GET /pages/:id' do
    before { get "/pages/#{page_id}" }

    context 'when the record exists' do
      it 'returns the page' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(page_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:page_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Page/)
      end
    end
  end

  # Test suite for POST /pages
  describe 'POST /pages' do
    # valid payload
    let(:valid_attributes) { { url: 'https://www.google.com' } }

    context 'when the request is valid' do
      before { post '/pages', params: valid_attributes }

      it 'creates a page' do
        expect(json['url']).to eq('https://www.google.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/pages', params: { url: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Url is not valid/)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /pages/:id' do
    before { delete "/pages/#{page_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end