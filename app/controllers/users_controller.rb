class UsersController < ApplicationController

  def show
   @user = User.find(params[:id])
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
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end
  
end
