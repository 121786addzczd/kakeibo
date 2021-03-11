class ApplicationController < ActionController::Base
  # 未ログインのリクエスト処理
  def redirect_to_sign_in
    redirect_to sign_in_path if session[:user_id].blank?
  end
end
