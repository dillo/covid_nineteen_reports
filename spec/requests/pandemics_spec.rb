require 'rails_helper'

RSpec.describe '/pandemics', type: :request do
  let(:valid_attributes) { { name: 'Pandemic', description: 'Pandemic Description' } }
  let(:invalid_attributes) { { name: '', description: '' } }

  describe 'GET /index' do
    it 'renders a successful response' do
      Pandemic.create! valid_attributes
      get pandemics_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      pandemic = Pandemic.create! valid_attributes
      get pandemic_url(pandemic)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_pandemic_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      pandemic = Pandemic.create! valid_attributes
      get edit_pandemic_url(pandemic)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Pandemic' do
        expect do
          post pandemics_url, params: { pandemic: valid_attributes }
        end.to change(Pandemic, :count).by(1)
      end

      it 'redirects to the created pandemic' do
        post pandemics_url, params: { pandemic: valid_attributes }
        expect(response).to redirect_to(pandemic_url(Pandemic.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Pandemic' do
        expect do
          post pandemics_url, params: { pandemic: invalid_attributes }
        end.to change(Pandemic, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post pandemics_url, params: { pandemic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'Pandemic Updated', description: 'Pandemic Description' } }

      it 'updates the requested pandemic' do
        pandemic = Pandemic.create! valid_attributes
        patch pandemic_url(pandemic), params: { pandemic: new_attributes }
        pandemic.reload
        expect(pandemic.name).to eq('Pandemic Updated')
      end

      it 'redirects to the pandemic' do
        pandemic = Pandemic.create! valid_attributes
        patch pandemic_url(pandemic), params: { pandemic: new_attributes }
        pandemic.reload
        expect(response).to redirect_to(pandemic_url(pandemic))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        pandemic = Pandemic.create! valid_attributes
        patch pandemic_url(pandemic), params: { pandemic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested pandemic' do
      pandemic = Pandemic.create! valid_attributes
      expect do
        delete pandemic_url(pandemic)
      end.to change(Pandemic, :count).by(-1)
    end

    it 'redirects to the pandemics list' do
      pandemic = Pandemic.create! valid_attributes
      delete pandemic_url(pandemic)
      expect(response).to redirect_to(pandemics_url)
    end
  end
end
