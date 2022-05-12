class UserRepository
  
  class << self

    def index
     @users = User.all
    end

    def new
      @user = User.new
    end

    def create(user)
      @user =User.new(user)
      isSave = @user.save
    end

    def create_user(user)
      @user = User.new(user)
    end

    def find_by_id(id)
      @user = User.find(id)
    end

    def update(user,user_form)
      isUpdate = user.update(user_form)
    end

    def delete(user)
      user.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :mobile, :email, :password, :password_confirmation, :address)
    end

  end
end