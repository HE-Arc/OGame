class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create, :index]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1z
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

    solarsys = Solarsystem.create(name: [*('A'..'Z')].sample(6).join, position_x: rand(-10..10), position_y: rand(-10..10), position_z: rand(-10..10))
    mother_planet = Planet.new(name: solarsys.name+"-0", solarsystem: solarsys, nb_cases: rand(8..13), position_x: rand(-3..3), position_y: rand(-3..3), position_z: rand(-3..3))
    mother_planet.save
    solarsys.planets << mother_planet
    @user.planet = mother_planet

    for i in 0..rand(4..7)
      solarsys.planets.create(name: solarsys.name+"-"+i.to_s, solarsystem: solarsys, nb_cases: rand(6..10), position_x: rand(-3..3), position_y: rand(-3..3), position_z: rand(-3..3))
    end

    respond_to do |format|
      if @user.save
        mother_planet.user = @user
        mother_planet.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
