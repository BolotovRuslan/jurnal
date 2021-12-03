class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new(parent_id: params[:parent_id])
    @pages = Page.all
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page, notice: 'Successfully created'
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to root_path, notice: 'Successfully destroyed'
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :header, :body, :parent_id)
  end
end
