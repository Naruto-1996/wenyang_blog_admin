class MembersController < ApplicationController
  def sign_in
    render :layout => 'empty'
  end


  def login_with_password

    redirect_to "/welcome/welcome"
  end
end
