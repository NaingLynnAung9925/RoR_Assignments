class UserService

  class << self
    
    def index
      UserRepository.index
    end
    
    def new
      UserRepository.new
    end

    def create(user)
      isSave = UserRepository.create(user)
    end
    
    def create_user(user)
      UserRepository.create_user(user)
    end
    
    def update(id,user_form)
      @user = UserRepository.find_by_id(id)
      isUpdate = UserRepository.update(@user,user_form)
    end

    def delete(id)
      @user = UserRepository.find_by_id(id)
      UserRepository.delete(@user)
    end

    def set_user(id)
      @user.UserRepository.find_by_id(id)
    end

  end

end