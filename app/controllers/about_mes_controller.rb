class AboutMesController < ApplicationController
  before_action :set_about_me, only: %i[ show edit update destroy ]

  # GET /about_mes or /about_mes.json
  def index
    @about_mes = AboutMe.all
  end

  # GET /about_mes/1 or /about_mes/1.json
  def show
  end

  # GET /about_mes/new
  def new
    @about_me = AboutMe.new
  end

  # GET /about_mes/1/edit
  def edit
  end

  # POST /about_mes or /about_mes.json
  def create
    @about_me = AboutMe.new(about_me_params)

    if @about_me.valid?
      Rails.logger.info "====================="
      @about_me.save!
      redirect_to about_mes_path
    end
  end

  # PATCH/PUT /about_mes/1 or /about_mes/1.json
  def update
    if @about_me.valid?
      @about_me.update(about_me_params)
      redirect_to about_mes_path
    end
  end

  # DELETE /about_mes/1 or /about_mes/1.json
  def destroy
    @about_me.destroy
    redirect_to about_mes_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_me
      @about_me = AboutMe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def about_me_params
      params.require(:about_me).permit(:birthday, :graduated_from, :website, :hobby, :address, :title, :description)
    end
end
