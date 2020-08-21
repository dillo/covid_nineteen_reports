class DataUrlsController < ApplicationController
  before_action :find_pandemic
  before_action :set_data_url, only: %i[show edit update destroy]

  def index
    @data_urls = @pandemic.data_urls
  end

  def show; end

  def new
    @data_url = @pandemic.data_urls.build
  end

  def edit; end

  def create
    @data_url = @pandemic.data_urls.build(data_url_params)

    respond_to do |format|
      if @data_url.save
        format.html { redirect_to pandemic_path(@pandemic), notice: 'Data url was successfully created.' }
        format.json { render :show, status: :created, location: @data_url }
      else
        format.html { render :new }
        format.json { render json: @data_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @data_url.update(data_url_params)
        format.html { redirect_to pandemic_path(@pandemic), notice: 'Data url was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_url }
      else
        format.html { render :edit }
        format.json { render json: @data_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @data_url.destroy
    respond_to do |format|
      format.html { redirect_to pandemic_path(@pandemic), notice: 'Data url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_pandemic
    @pandemic = Pandemic.find(params[:pandemic_id])
  end

  def set_data_url
    @data_url = @pandemic.data_urls.find(params[:id])
  end

  def data_url_params
    params.require(:data_url).permit(:source_name, :source_url, :data_type, :pandemic_id)
  end
end
