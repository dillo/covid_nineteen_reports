require "rails_helper"

RSpec.describe Pandemic, type: :model do
  describe "#valid?" do
    let(:pandemic) { Pandemic.new(params) }

    context "when no params" do
      let(:params) { {} }

      it "must return false" do
        expect(pandemic.valid?).to eq(false)
      end
    end

    context "when params" do
      let(:params) { { name: "Pandemic", description: "Pandemic Description" } }

      it "must return true" do
        expect(pandemic.valid?).to eq(true)
      end

      it "must increase count by 1" do
        expect { Pandemic.create!(params) }.to change(Pandemic, :count).by(1)
      end
    end
  end
end
