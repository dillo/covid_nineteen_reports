class PandemicsController < ApplicationController
  include ErrorHandlers::RedisErrors

  before_action :data_urls, only: :edit
  before_action :destroy_pandemics_cache, only: %i[create update destroy]

  def index
    @pandemics = Pandemics::Factory::Index.manufacture.get
  end

  def show;
    @pandemic = Pandemics::Factory::Show.manufacture(params[:id]).get
  end

  def new
    @pandemic = Pandemics::Factory::New.manufacture.get
  end

  def edit; end

  def create
    @pandemic = Pandemic.new(pandemic_params)

    if @pandemic.save
      redirect_to(@pandemic, notice: 'Pandemic was successfully created.')
    else
      render :new
    end
  end

  def update
    if @pandemic.update(pandemic_params)
      redirect_to(@pandemic, notice: 'Pandemic was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @pandemic.destroy

    redirect_to(pandemics_url, notice: 'Pandemic was successfully destroyed.')
  end

  private

  def data_urls
    @data_urls = cache('all-data_urls') { DataUrl.all.to_a }
  end

  def destroy_pandemics_cache
    Rails.cache.delete("pandemic-#{params[:id]}")
    Rails.cache.delete('all-pandemics')
  end

  def pandemic_params
    params.require(:pandemic).permit(:name, :description, data_url_ids: [])
  end
end
