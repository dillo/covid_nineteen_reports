class DataUrlsController < ApplicationController
  before_action :data_url, only: %i[show edit update destroy]

  def index
    @data_urls = DataUrl.all
  end

  def show; end

  def new
    @data_url = DataUrl.new
  end

  def edit; end

  def create
    @data_url = DataUrl.new(data_url_params)

    respond_to do |format|
      if @data_url.save
        format.html { redirect_to @data_url, notice: 'Data Url was successfully created.' }
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
        format.html { redirect_to @data_url, notice: 'Data Url was successfully updated.' }
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
      format.html { redirect_to data_urls_url, notice: 'Data Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def data_url
    @data_url ||= DataUrl.find(params[:id])
  end

  def data_url_params
    params.require(:data_url).permit(:source_name, :source_url, :data_type, :description)
  end
end
