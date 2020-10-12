class PandemicsController < ApplicationController
  before_action :pandemic, only: %i[show edit update destroy]

  def index
    key = 'all-pandemics'

    @pandemics = Rails.cache.fetch(key) do
      Pandemic.all.to_a
    end
  end

  def show; end

  def new
    @pandemic = Pandemic.new
  end

  def edit
    key = 'all-data_urls'

    @data_urls = Rails.cache.fetch(key) do
      DataUrl.all.to_a
    end
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
    respond_to do |format|
      if @pandemic.update(pandemic_params)
        format.html { redirect_to @pandemic, notice: 'Pandemic was successfully updated.' }
        format.json { render :show, status: :ok, location: @pandemic }
      else
        format.html { render :edit }
        format.json { render json: @pandemic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pandemic.destroy

    respond_to do |format|
      format.html { redirect_to pandemics_url, notice: 'Pandemic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def pandemic
    key = "show-#{__method__}-#{params[:id]}"

    @pandemic = Rails.cache.fetch(key) do
      Pandemic.includes(:data_urls).find(params[:id])
    end
  end

  def pandemic_params
    params.require(:pandemic).permit(:name, :description, data_url_ids: [])
  end
end
