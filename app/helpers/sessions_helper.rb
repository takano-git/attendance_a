module SessionsHelper
  
  # 引数にわたされたユーザーオブジェクトでログインします。
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    # sessiomに保存されているuser_idを消去
    session.delete(:user_id)
    # @current_userにnilを代入
    @current_user = nil
  end
  
  # 現在ログイン中のユーザーがいる場合オブジェクトでログインします
  # 一時的セッション内のユーザーIDをデータベースから取得出来るようにします
  
  # def current_user  
  #   if session[:user_id]
  #     if @current_user.nil?
        # find_byならnilだった場合でも、例外処理は発生せずにnilが返されます。
  #       @current_user = User.find_by(id: session[:user_id])
  #     else
  #       @current_user
  #     end
  #   end
  # end
  
  def current_user
    if session[:user_id]
    # @current_user = @current_user || User.find_by(id: session[:user_id])
      @current_user ||=  User.find_by(id: session[:user_id])
    end
  end
  
  # 現在ログイン中のユーザーがいればtrue,そうでなければfalseを返します。
  # セッションにuser_idが入ってないか@current_userにユーザーオブジェクトが入っていない
  
  def logged_in?
    !current_user.nil?
  end
  
end
