class PageVisitsController < ApplicationController
  before_action :set_page_visit, only: [:show, :edit, :update, :destroy]

  # GET /page_visits
  # GET /page_visits.json
  def index
    @page_visits = PageVisit.all
  end

  # GET /page_visits/1
  # GET /page_visits/1.json
  def show
  end

  # GET /page_visits/new
  def new
    @page_visit = PageVisit.new
	@user_choice = User.order("lastname").collect do |c| [c.lastname + ", " + c.firstname, c.id] end
	@page_choice = Page.order("url").collect do |c| [c.url, c.id] end

  end

  # GET /page_visits/1/edit
  def edit
  @user_choice = User.order("lastname").collect do |c| [c.lastname + ", " + c.firstname, c.id] end
	@page_choice = Page.order("url").collect do |c| [c.url, c.id] end

  end

  # POST /page_visits
  # POST /page_visits.json
  def create
    @page_visit = PageVisit.new(page_visit_params)

    respond_to do |format|
      if @page_visit.save
        format.html { redirect_to @page_visit, notice: 'Page visit was successfully created.' }
        format.json { render :show, status: :created, location: @page_visit }
      else
        format.html { render :new }
        format.json { render json: @page_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_visits/1
  # PATCH/PUT /page_visits/1.json
  def update
    respond_to do |format|
      if @page_visit.update(page_visit_params)
        format.html { redirect_to @page_visit, notice: 'Page visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_visit }
      else
        format.html { render :edit }
        format.json { render json: @page_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_visits/1
  # DELETE /page_visits/1.json
  def destroy
    @page_visit.destroy
    respond_to do |format|
      format.html { redirect_to page_visits_url, notice: 'Page visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_visit
      @page_visit = PageVisit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_visit_params
      params.require(:page_visit).permit(:user_id, :page_id, :visitdate)
    end
end
