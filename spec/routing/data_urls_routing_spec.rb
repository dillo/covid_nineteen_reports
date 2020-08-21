require 'rails_helper'

RSpec.describe DataUrlsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: "/pandemics/1/data_urls").to route_to('data_urls#index', pandemic_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/pandemics/1/data_urls/new').to route_to('data_urls#new', pandemic_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/pandemics/1/data_urls/1').to route_to('data_urls#show', pandemic_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/pandemics/1/data_urls/1/edit').to route_to('data_urls#edit', pandemic_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/pandemics/1/data_urls').to route_to('data_urls#create', pandemic_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/pandemics/1/data_urls/1').to route_to('data_urls#update', pandemic_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/pandemics/1/data_urls/1').to route_to('data_urls#update', pandemic_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/pandemics/1/data_urls/1').to route_to('data_urls#destroy', pandemic_id: '1', id: '1')
    end
  end
end
