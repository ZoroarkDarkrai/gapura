class Admin::TestimoniesController < ApplicationController
  before_action :ensure_admin
  before_action :set_testimony, only: [:show, :edit, :update, :destroy]

  def index
    @testimonies = Testimony.all
  end

  def show
  end

  def new
    @testimony = Testimony.new
    @testimony.build_photo
  end

  def edit
    @testimony.build_photo if @testimony.photo.nil?
  end

  def create
    @testimony = Testimony.new(testimony_params)

    if @testimony.save
      redirect_to admin_testimony_url(@testimony), notice: 'Testimony was successfully created.'
    else
      render :new
    end
  end

  def update
    if @testimony.update(testimony_params)
      redirect_to admin_testimony_url(@testimony), notice: 'Testimony was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @testimony.destroy
    redirect_to admin_testimonies_url, notice: 'Testimony was successfully destroyed.'
  end

  private
    def set_testimony
      @testimony = Testimony.find(params[:id])
    end

    def testimony_params
      params.require(:testimony).permit(:name, :profession, :testimony,
        photo_attributes: [:id, :file, :_destroy])
    end
end
