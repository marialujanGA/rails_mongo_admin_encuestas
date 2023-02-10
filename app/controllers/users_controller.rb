class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  include Filterable

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, status: :see_other }
        
        flash[:notice] = "#{@user.email} fue agregado exitosamente." 
        
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "Ha ocurrido un error. Por favor vuelva a intentarlo." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        redirect_to users_path 
        flash[:notice] = "El estado de la encuesta cambiado para #{@user.email}" 

      else
        format.html { render :edit, status: :unprocessable_entity, notice: "Ha ocurrido un error. Por favor vuelva a intentarlo." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "El usuaro fue eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  # def list
  # #   # # users = User.includes(:course_code)
  # #   # # users = users.where('sis_id ilike ?', "%#{params[:sis_id]}%") if params[:sis_id].present?
  # #   # # users = users.order("#{params[:column]} #{params[:direction]}")
  # #   # # render(partial: 'users', locals: { users: users })
  #   users = filter!(User)
  #   render(partial: 'users', locals: { users: users })
  # end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:_id, :name, :email, :sis_id, :university, :course_code, :initial_active, :initial_answered, :midterm_active, :midterm_answered, :exit_active, :exit_answered)
    end
end
