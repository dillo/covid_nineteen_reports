class PandemicsController < ApplicationController
  before_action :pandemic, only: %i[show edit update destroy]

  def index
    @pandemics = Pandemic.all
  end

  def show; end

  def new
    @pandemic = Pandemic.new
  end

  def edit; end

  def create
    @pandemic = Pandemic.new(pandemic_params)

    respond_to do |format|
      if @pandemic.save
        format.html { redirect_to @pandemic, notice: 'Pandemic was successfully created.' }
        format.json { render :show, status: :created, location: @pandemic }
      else
        format.html { render :new }
        format.json { render json: @pandemic.errors, status: :unprocessable_entity }
      end
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
    @pandemic ||= Pandemic.find(params[:id])
  end

  def pandemic_params
    params.require(:pandemic).permit(:name, :description, data_url_ids: [])
  end
end
