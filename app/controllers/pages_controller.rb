class PagesController < ApplicationController

  def new
    @page = Page.new
  end

  def create
    @page = Page.new
    if @page.save
      redirect_to
    else
      flash[:errors] = @page.errors.full_messages
      render :edit
  end

  def show
    @page = params[:id]
    redirect_to adventure_page_path(@adventure.page.id)
  end

end
