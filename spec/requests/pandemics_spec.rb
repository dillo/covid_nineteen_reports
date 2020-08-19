 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/pandemics", type: :request do
  # Pandemic. As you add validations to Pandemic, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { name: "Pandemic", description: "Pandemic Description" } }

  let(:invalid_attributes) { { name: "", description: "" } }

  describe "GET /index" do
    it "renders a successful response" do
      Pandemic.create! valid_attributes
      get pandemics_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pandemic = Pandemic.create! valid_attributes
      get pandemic_url(pandemic)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_pandemic_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      pandemic = Pandemic.create! valid_attributes
      get edit_pandemic_url(pandemic)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pandemic" do
        expect {
          post pandemics_url, params: { pandemic: valid_attributes }
        }.to change(Pandemic, :count).by(1)
      end

      it "redirects to the created pandemic" do
        post pandemics_url, params: { pandemic: valid_attributes }
        expect(response).to redirect_to(pandemic_url(Pandemic.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pandemic" do
        expect {
          post pandemics_url, params: { pandemic: invalid_attributes }
        }.to change(Pandemic, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post pandemics_url, params: { pandemic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: "Pandemic Updated", description: "Pandemic Description" } }

      it "updates the requested pandemic" do
        pandemic = Pandemic.create! valid_attributes
        patch pandemic_url(pandemic), params: { pandemic: new_attributes }
        pandemic.reload
        expect(pandemic.name).to eq("Pandemic Updated")
      end

      it "redirects to the pandemic" do
        pandemic = Pandemic.create! valid_attributes
        patch pandemic_url(pandemic), params: { pandemic: new_attributes }
        pandemic.reload
        expect(response).to redirect_to(pandemic_url(pandemic))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        pandemic = Pandemic.create! valid_attributes
        patch pandemic_url(pandemic), params: { pandemic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pandemic" do
      pandemic = Pandemic.create! valid_attributes
      expect {
        delete pandemic_url(pandemic)
      }.to change(Pandemic, :count).by(-1)
    end

    it "redirects to the pandemics list" do
      pandemic = Pandemic.create! valid_attributes
      delete pandemic_url(pandemic)
      expect(response).to redirect_to(pandemics_url)
    end
  end
end
