class RidesController < ApplicationController
 
  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      flash[:notice] = "New ride created"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Problem with the ride!"
      render('new')
    end
      
  end

  def edit
    @ride = Ride.find_by_ride_secret(params[:ride_secret])
  end

  def update
    @ride = Ride.find_by_ride_secret(params[:ride_secret])
    if @ride.update_attributes(ride_params)
      flash[:notice] = "Ride updated"
      redirect_to(:action => 'show', :id => @ride.id)
    else
      flash[:notice] = "Problem with the ride!"
      render('edit')
    end
  end

  def delete
  end

  def about
    render('about')
  end

  private

    def ride_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:ride).permit(:driver_name, :going_to, :leaving_from, :email, :ride_secret, :date_leaving, :driver_phone, :seats_in_car, :notes, :expiry_date)
    end

end
