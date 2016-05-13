class RegAppsController < ApplicationController

  def index
    @reg_apps = current_user.reg_apps.all
  end

  def show
    @reg_app = RegApp.find(params[:id])
  end

  def new
    @reg_app = RegApp.new
  end

  def create
    @reg_app = RegApp.new(reg_app_params)
    @reg_app.user = current_user

    if @reg_app.save
      flash[:notice] = "Application was registered successfully"
      redirect_to user_reg_apps_path
    else
      flash[:alert] = "Application registration was unsuccessful. Please try again"
      render :new
    end
  end

  def edit
    @reg_app = RegApp.find(params[:id])
  end

  def update
    @reg_app = RegApp.find(params[:id])
    @reg_app.assign_attributes(reg_app_params)

    if @reg_app.save
      flash[:notice] = "App was updated successfully"
      redirect_to user_reg_app_path
    else
      flash[:alert] = "There was an error updating the App. Please try again."
      render :edit
    end
  end

  def destroy
    @reg_app = RegApp.find(params[:id])

    if @reg_app.destroy
      flash[:notice] = "\"#{@reg_app.name}\" was deleted successfully"
      redirect_to action: :index
    else
      flash[:alert] = "There was an error de-registering \"#{@reg_app.name}\". Please try again"
      render :show
    end
  end

  private

  def reg_app_params
    params.require(:reg_app).permit(:name, :url)
  end
end
