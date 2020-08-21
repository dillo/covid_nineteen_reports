require 'rails_helper'

RSpec.describe '/data_urls', type: :request do
  let(:pandemic) { Pandemic.create!(name: 'Pandemic', description: 'Pandemic Description') }
  let(:valid_attributes) do
    { source_name: 'CDC', source_url: 'https://www.example.com/foo.json', data_type: 'json', pandemic_id: pandemic.id }
  end
  let(:invalid_attributes) do
    { source_name: '', source_url: '', data_type: 'bla', pandemic_id: pandemic.id }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      DataUrl.create! valid_attributes
      get pandemic_data_urls_path(pandemic)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      data_url = DataUrl.create! valid_attributes
      get pandemic_data_url_path(pandemic, data_url)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_pandemic_data_url_path(pandemic)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      data_url = DataUrl.create! valid_attributes
      get edit_pandemic_data_url_path(pandemic, data_url)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new DataUrl' do
        expect do
          post pandemic_data_urls_path(pandemic), params: { data_url: valid_attributes }
        end.to change(DataUrl, :count).by(1)
      end

      it 'redirects to the created pandemic' do
        post pandemic_data_urls_path(pandemic), params: { data_url: valid_attributes }
        expect(response).to redirect_to(pandemic_path(pandemic))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new DataUrl' do
        expect do
          post pandemic_data_urls_path(pandemic), params: { data_url: invalid_attributes }
        end.to change(DataUrl, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post pandemic_data_urls_path(pandemic), params: { data_url: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { source_name: 'CDC EDIT', source_url: 'https://www.example.com/foo.json', data_type: 'json', pandemic_id: pandemic.id }
      end

      it 'updates the requested data_url' do
        data_url = pandemic.data_urls.create! valid_attributes
        patch pandemic_data_url_path(pandemic, data_url), params: { data_url: new_attributes }
        data_url.reload
        expect(response).to redirect_to(pandemic_path(pandemic))
      end

      it 'redirects to the data_url' do
        data_url = pandemic.data_urls.create! valid_attributes
        patch pandemic_data_url_path(pandemic, data_url), params: { data_url: new_attributes }
        data_url.reload
        expect(response).to redirect_to(pandemic_path(pandemic))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        data_url = pandemic.data_urls.create! valid_attributes
        patch pandemic_data_url_path(pandemic, data_url), params: { data_url: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested data_url' do
      data_url = pandemic.data_urls.create! valid_attributes
      expect do
        delete pandemic_data_url_path(pandemic, data_url)
      end.to change(DataUrl, :count).by(-1)
    end

    it 'redirects to the data_urls list' do
      data_url = pandemic.data_urls.create! valid_attributes
      delete pandemic_data_url_path(pandemic, data_url)
      expect(response).to redirect_to(pandemic_path(pandemic))
    end
  end
end
