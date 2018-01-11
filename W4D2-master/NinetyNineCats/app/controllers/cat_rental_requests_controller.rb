class CatRentalRequestsController < ApplicationController

  def index
    @rental_requests = CatRentalRequest.all
    render :index
  end

  def show
    @rental_request = CatRentalRequest.find_by(id: params[:id])

    if @rental_request
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end

  def new
    @rental_request = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @rental_request = CatRentalRequest.new
  end

  def edit
    @rental_request = CatRentalRequest.find_by(id: params[:id])
    #....
  end

  def update
    #...
  end

  private

  def rental_request_params
    params.require(:rental_request).permit(:cat_id, :start_date, :end_date)
  end

end
