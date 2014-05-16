class PagesController < ApplicationController
before_action: 

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
  end

  def show
    @page = Page.find(params[:id])
    @adventure = @page.adventure                   
    render adventure_page_path(@adventure, @page)
  end

end
