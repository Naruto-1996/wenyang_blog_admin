class BannerIntroducesController < ApplicationController
  before_action :find_banner_introduce, only: [:show, :edit, :update, :destroy]


  def index
    @introduces = BannerIntroduce.all
  end

  def new
    @introduce = BannerIntroduce.new
  end

  def show

  end

  def edit
    @introduce_detail = BannerIntroduce.find(params[:id])
  end

  def create
    Rails.logger.info "=================#{introduce_params.inspect}"
      @introduce = BannerIntroduce.new(introduce_params)
    if @introduce.valid?
      # @introduce = BannerIntroduce.new(title: params[:title], little_title: params[:little_title], description: params[:description])
      @introduce.save!
      redirect_to banner_introduces_path
    end

  end

  def update
    @introduce = BannerIntroduce.find(params[:id])
    if @introduce.valid? @introduce.update(introduce_params)
      redirect_to banner_introduces_path

    end

  end

  def destroy
    @introduce.destroy!
    redirect_to banner_introduces_path
  end


  private

  def find_banner_introduce
    @introduce = BannerIntroduce.find(params[:id])
  end

  def introduce_params
    params.require(:introduce).permit(:title, :little_title, :description)
  end

end
