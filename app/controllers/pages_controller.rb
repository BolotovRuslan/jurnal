class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(parent_id: params[:parent_id])
    @pages = Page.all
  end

  def create
    @page = Page.new(page_params)
    @page.parent_id = params[:parent_id]

    if @page.save
      redirect_to @page, notice: 'Successfully created'
    else
      render :new
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :header, :body, :ancestry)
  end
end
