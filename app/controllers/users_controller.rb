class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user_or_admin_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    # モデルがユーザだから userというハッシュにキーと値のペアを入れているよ、と理解している
    # シンボルはハッシュのキーとして使われているよ
    # シンボルをキーにするとキーを""で囲わなくていいというメリットがあるよ　
    # @user = User.new(params[:user])
    # ↑これは悪い人が悪いことするかもしれないからストロングパラメーターを使う
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規作成に成功しました。'
    # redirect_to user_url(@user) これの省略形が下↓
    
      redirect_to @user 
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    # システム管理者でなければ
    if !current_user.admin
      if @user.update_attributes(user_params)
        flash[:success] = "ユーザー情報を更新しました。"
        redirect_to @user
      else
        render :edit
      end
    else
      if @user.update_attributes(user_params)
        flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
      else
        render :edit
      end
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end




  # before フィルター
  
  # paramsハッシュからユーザーを取得します。
  def set_user
    @user = User.find(params[:id])
  end
  
  # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] ="ログインしてください"
      redirect_to login_url
    end
  end

 # ログイン済みのユーザーか確認します。
  def correct_user
    # @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  # システム管理権限所有者かどうかを判断します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def correct_user_or_admin_user
    redirect_to root_url unless current_user?(@user) || current_user.admin?
  end
  
end
