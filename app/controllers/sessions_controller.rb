class SessionsController < ApplicationController
  def new
  end
  
  def create

  # 1個目がparams[:session]になるのは,フォームで指定され送られてきたからと考えている
  #        User.find_by(email: "sample@email.com")
    user = User.find_by(email: params[:session][:email].downcase)
    # Rubyではnilとfalse以外の全てのオブジェクトがtrueになるという性質がある
    # 無いならnil password違えばfalse
    if user && user.authenticate(params[:session][:password])
      # ログイン後にユーザー情報ページにリダイレクトします。
      # 引数に渡されたユーザーオブジェクトでログインします。
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      # renderhはリクエストではなくページをレンダリングしている。
      # なので.nowがいる。
      # redirect_toならいらないのだと思う
      # flash.nowではレンダリングが終わっているページでフラッシュメッセージを表示することができます。
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end
  
  def destroy
    # ログイン中の場合のみログアウト処理を実行します。
    log_out if logged_in?
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
  
end
