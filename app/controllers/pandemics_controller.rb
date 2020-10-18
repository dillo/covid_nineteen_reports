class PandemicsController < ApplicationController
  include ErrorHandlers::RedisErrors

  before_action :pandemic, only: %i[show edit update destroy]
  before_action :data_urls, only: %i[new edit]

  def index
    @pandemics = cache('all-pandemics') { Pandemic.all.to_a }
  end

  def show; end

  def new
    @pandemic = Pandemic.new
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

  def pandemic
    @pandemic = cache("pandemic-#{params[:id]}") { Pandemic.includes(:data_urls).find(params[:id]) }
  end

  def data_urls
    @data_urls = cache('all-data_urls') { DataUrl.all.to_a }
  end

  def pandemic_params
    params.require(:pandemic).permit(:name, :description, data_url_ids: [])
  end
end
