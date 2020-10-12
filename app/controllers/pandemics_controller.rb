class PandemicsController < ApplicationController
  before_action :pandemic, only: %i[show edit update destroy]

  def index
    key = 'all-pandemics'
    @pandemics = Rails.cache.fetch(key) { Pandemic.all.to_a }
  end

  def show; end

  def new
    @pandemic = Pandemic.new
  end

  def edit
    key = 'all-data_urls'
    @data_urls = Rails.cache.fetch(key) { DataUrl.all.to_a }
  end

  def create
    @pandemic = Pandemic.new(pandemic_params)

    if @pandemic.save
      redirect_to @pandemic, notice: 'Pandemic was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pandemic.update(pandemic_params)
      redirect_to @pandemic, notice: 'Pandemic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pandemic.destroy

    redirect_to pandemics_url, notice: 'Pandemic was successfully destroyed.'
  end

  private

  def pandemic
    key = "show-#{__method__}-#{params[:id]}"
    @pandemic = Rails.cache.fetch(key) { Pandemic.includes(:data_urls).find(params[:id]) }
  end

  def pandemic_params
    params.require(:pandemic).permit(:name, :description, data_url_ids: [])
  end
end
