class UserRepository 
  
  class << self
    
    def index
       @users = User.all
    end

    def new
      @user = User.new
    end

    def create(user)
      @user = User.new(user)
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

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type, :phone, :address, :birthday)
    end

  end

end