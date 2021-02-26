class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  #before_action :check_session_expiry, if: proc{!request.url.include?('/signin')}
  before_action :check_session_expiry

  # 获取当前登录对象
  def current_manager
    if session[:current_manager_id].present?
      manager =  Manager.find(session[:current_manager_id])
    else
      manager = nil
    end
    manager
  end

  # 退出登录
  def logout
    session[:current_manager_id] = nil
    reset_session
    redirect_to "/"
  end

  private
  # 如果未登录页面跳转到登录页面
  def require_login
    #Rails.logger.info "=========================>>>>>>>"
    #Rails.logger.info "=========================>>>>>>>#{session[:current_manager_id]}"
    unless current_manager.present?
      redirect_to "/"
    end
  end

  def check_session_expiry
    if !session[:expires_at].nil? and session[:expires_at] < Time.now
      reset_session
      redirect_to "/"
    end
    session[:expires_at] = 30.minutes.from_now
    #session[:expires_at] = 10.seconds.from_now
  end

end
