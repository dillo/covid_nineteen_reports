class DataUrlsController < ApplicationController
  before_action :data_url, only: %i[show edit update destroy]

  def index
    @data_urls = cache('all-data_urls') { DataUrl.all.to_a }
  end

  def show; end

  def new
    @data_url = DataUrl.new
  end

  def edit; end

  def create
    @data_url = DataUrl.new(data_url_params)

    if @data_url.save
      redirect_to @data_url, notice: 'Data Url was successfully created.'
    else
      render :new
    end
  end

  def update

    if @data_url.update(data_url_params)
      redirect_to @data_url, notice: 'Data Url was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @data_url.destroy

    redirect_to data_urls_url, notice: 'Data Url was successfully destroyed.'
  end

  private

  def data_url
    @data_url = cache("data-url-#{params[:id]}") { DataUrl.find(params[:id]) }
  end

  def data_url_params
    params.require(:data_url).permit(:source_name, :source_url, :data_type, :description)
  end
end
