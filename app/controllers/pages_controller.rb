class PagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @pages = Page.all
    json_response(@pages)
  end

  # POST /todos
  def create
    @page = Page.create!(page_params)
    json_response(@page, :created)
  end

  # GET /todos/:id
  def show
    json_response(@page)
  end

  # PUT /todos/:id
  def update
    @page.update(page_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @page.destroy
    head :no_content
  end

  private

  def page_params
    # whitelist params
    params.permit(:url)
  end

  def set_page
    @page = Page.find(params[:id])
  end
end
