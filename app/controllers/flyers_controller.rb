class FlyersController < ApplicationController
  before_action :set_flyer, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @flyers = Flyer.all.page(params[:page])
  end

  def new
    @flyer = Flyer.new
  end

  def create
    @flyer = current_user.flyers.build(flyer_params)
    @flyer.user = current_user
    user_uploaded_image_path = @flyer.picture.path
    result_image = @flyer.process_image(user_uploaded_image_path) # 画像にテキストを挿入
    if @flyer.save
      redirect_to flyer_path(@flyer), notice: 'Flyer was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
      @flyer.user = current_user
    user_uploaded_image_path = @flyer.picture.path
    result_image = @flyer.process_image(user_uploaded_image_path) # 画像にテキストを挿入

    if @flyer.update(flyer_params)
      redirect_to flyer_path(@flyer), notice: 'Flyer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    flyer = current_user.flyers.find(params[:id])
    flyer.destroy!
    redirect_to flyers_path, notice: 'Flyer was successfully destroyed.', status: :see_other
  end

  private

  def set_flyer
    @flyer = Flyer.find(params[:id])
  end

  def flyer_params
    params.require(:flyer).permit(:title, :requirement, :searching_for, :gathering_place, :picture, :picture_cache, :picture_two, :picture_tow_cache, :item_image_cache, :tag_list)
  end
end
