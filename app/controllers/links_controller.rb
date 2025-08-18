class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: %i[edit update destroy]

  def index
    @links = current_user.links.ordered
  end

  def new
    @link = current_user.links.build
  end

  def edit; end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to dashboard_path, notice: "Link was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @link.update(link_params)
      redirect_to dashboard_path, notice: "Link was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to dashboard_path, notice: "Link was successfully deleted."
  end

  private

  def set_link
    @link = current_user.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url, :description, :active, :position)
  end
end
