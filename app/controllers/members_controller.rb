class MembersController < ActionController::Base




  def sign_in
    if session[:current_manager_id].blank?
      render :layout => 'empty'
    else
      redirect_to "/welcome/welcome"
    end

  end


  def login_with_password
    # Rails.logger.info "===========参数============"
    # Rails.logger.info "account -> #{login_params[:account]}"
    # Rails.logger.info "password -> #{login_params[:password]}"
    manager = Manager.find_by_account(login_params[:account])
    if manager.blank?
      render json: '{"code": 400, "errorMessage" : "用户不存在"}'

    elsif manager.password != login_params[:password]

      render json: '{"code": 400, "errorMessage" : "密码输入错误"}'
    else
      render json: '{"code": 200, "redirectTo" : "/welcome/welcome"}'
      session[:current_manager_id] = manager.id
      session[:expires_at] = 10.seconds.from_now
    end

  end


  private

  def login_params
    params.require(:member).permit(:account, :password)
  end

end
