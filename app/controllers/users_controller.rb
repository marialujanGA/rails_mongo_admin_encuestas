class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  helper_method :toggle_initial, :toggle_midterm_acive, :toggle_exit_acive

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
        format.html { redirect_to user_url(@user), notice: "El usuario fue agregado exitosamente." }
        format.json { render :show, status: :created, location: @user }
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
        format.html { redirect_to user_url(@user), notice: "El usuario fue actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity, notice: "Ha ocurrido un error. Por favor vuelva a intentarlo." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "El usuaro fue eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  
  togglerList = ['initial', 'midterm', 'exit']


  def toggler
    togglerList.each do |instance|
      if params[:id].present?
        user = User.find(params[:id])
        user.update_attribute!(:instance_active, !user.instance_active)
        respond_to do |format|
          format.html { redirect_to root_path, notice: `El estado de la encuesta cambiado para ${user}` }
          format.json { head :no_content }
        end

      end
    end
   end

  # def toggle_middterm
  #   @user = User.find(@users["sis_id"])
  #   @user.toggle(:mideterm_active).save
  #   redirect_to :back
  # end

  # def toggle_exit
  #   @user = User.find(@users["sis_id"])
  #   @user.toggle(:exit_active).save
  #   redirect_to :back
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
