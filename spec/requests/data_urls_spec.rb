require 'rails_helper'

RSpec.describe '/data_urls', type: :request do
  let(:valid_attributes) do
    { source_name: 'CDC', source_url: 'https://www.example.com/foo.json', data_type: 'json' }
  end
  let(:invalid_attributes) do
    { source_name: '', source_url: '', data_type: 'bla' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      DataUrl.create! valid_attributes
      get data_urls_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      data_url = DataUrl.create! valid_attributes
      get data_url_path(data_url)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_data_url_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      data_url = DataUrl.create! valid_attributes
      get edit_data_url_path(data_url)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new DataUrl' do
        expect do
          post data_urls_url, params: { data_url: valid_attributes }
        end.to change(DataUrl, :count).by(1)
      end

      it 'redirects to the data urls path' do
        post data_urls_path, params: { data_url: valid_attributes }
        expect(response).to redirect_to(data_url_path(DataUrl.first))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new DataUrl' do
        expect do
          post data_urls_url, params: { data_url: invalid_attributes }
        end.to change(DataUrl, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post data_urls_url, params: { data_url: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { source_name: 'CDC EDIT', source_url: 'https://www.example.com/foo.json', data_type: 'json' }
      end

      it 'updates the requested data_url' do
        data_url = DataUrl.create! valid_attributes
        patch data_url_path(data_url), params: { data_url: new_attributes }
        data_url.reload
        expect(response).to redirect_to(data_url_path(data_url))
      end

      it 'redirects to the data_url' do
        data_url = DataUrl.create! valid_attributes
        patch data_url_path(data_url), params: { data_url: new_attributes }
        data_url.reload
        expect(response).to redirect_to(data_url_path(data_url))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        data_url = DataUrl.create! valid_attributes
        patch data_url_path(data_url), params: { data_url: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested data_url' do
      data_url = DataUrl.create! valid_attributes
      expect do
        delete data_url_path(data_url)
      end.to change(DataUrl, :count).by(-1)
    end

    it 'redirects to the data_urls list' do
      data_url = DataUrl.create! valid_attributes
      delete data_url_path(data_url)
      expect(response).to redirect_to(data_urls_url)
    end
  end
end
