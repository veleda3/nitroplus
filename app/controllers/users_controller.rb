class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]



  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.save(validate: false)
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to root_url


      # UserMailer.welcome_email(@user).deliver!
    else
      @errors = @user.errors.full_messages
      flash[:error] = "Invalid, please try again"
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'edit'
    end
  end

  def confirm_email
  @user = User.find_by_confirm_token(params[:token])
   if user
     user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to @user
   else
     flash[:error] = "Sorry. User does not exist"
     redirect_to root_url
   end
 end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
