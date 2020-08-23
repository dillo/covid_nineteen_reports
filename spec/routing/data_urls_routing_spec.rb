require 'rails_helper'

RSpec.describe DataUrlsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: "/data_urls").to route_to('data_urls#index')
    end

    it 'routes to #new' do
      expect(get: '/data_urls/new').to route_to('data_urls#new')
    end

    it 'routes to #show' do
      expect(get: '/data_urls/1').to route_to('data_urls#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/data_urls/1/edit').to route_to('data_urls#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/data_urls').to route_to('data_urls#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/data_urls/1').to route_to('data_urls#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/data_urls/1').to route_to('data_urls#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/data_urls/1').to route_to('data_urls#destroy', id: '1')
    end
  end
end
