class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
   @users = UserService.index
  end

  def search
    if params[:name].present?
      @q = params[:name]
      @users = User.where("name LIKE? ", @q)

    elsif params[:address].present?
      @q = params[:address]
      @users = User.where("address LIKE?", @q)

    elsif  params[:user_type].present?
      @q = params[:user_type]
      @users = User.where("user_type LIKE?",@q)

    elsif params[:email].present?
      @q = params[:email]
      @users = User.where("email LIKE?", @q)

    elsif params[:brithday].present?
      @q = params[:brithday]
      @users = User.where("birthday LIKE?", "%#{@q}%")

    elsif params[:phone].present?
      @q = params[:phone]
      @users = User.where("phone LIKE? ", @q)
    end
    render "index"
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = UserService.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = UserService.create_user(user_params)
    isSave = UserService.create(user_params)
    
      if isSave
        redirect_to root_path, notice: "User was successfully created." 
      else
        render :new, notice: "Existing Email"
      end
  
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
    isUpdate = UserService.update(params[:id],user_params)
      if isUpdate
        redirect_to user_url(@user), notice: "User was successfully updated."
      
      else
        render :edit
      
      end

  end

  # DELETE /users/1 or /users/1.json
  def destroy
    UserService.delete(params[:id])
      redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = UserService.set_user(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type, :phone, :address, :birthday)
    end

end
