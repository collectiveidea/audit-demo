class RevisionsController < ApplicationController
  
  def index
    @page = Page.find(params[:page_id])
  end
  
  def update
    @page = Page.find(params[:page_id])
    @page.revision(params[:id].to_i).save
    redirect_to(@page)
  end
  
end
