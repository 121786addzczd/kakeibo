class ApplicationController < ActionController::Base
  # 未ログインのリクエスト処理
  def redirect_to_signin
    redirect_to signin_path if session[:user_id].blank?
  end
end
