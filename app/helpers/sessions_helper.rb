module SessionsHelper

  # 引数にわたされたユーザーオブジェクトでログインします。
  def log_in(user)
    session[:user_id] = user.id
  end

  # 永続的セッションを記憶します（Userモデルを参照）
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 永続的セッションを破棄します
  def forget(user)
    user.forget # Userモデル参照
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # 現在ログイン中のユーザーがいる場合オブジェクトでログインします
  # 一時的セッション内のユーザーIDをデータベースから取得出来るようにします
  
  def current_user
    if (user_id = session[:user_id])
    # @current_user = @current_user || User.find_by(id: session[:user_id])
      @current_user ||=  User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # 現在ログイン中のユーザーがいればtrue,そうでなければfalseを返します。
  # セッションにuser_idが入ってないか@current_userにユーザーオブジェクトが入っていない
  
  def logged_in?
    !current_user.nil?
  end
  
end
