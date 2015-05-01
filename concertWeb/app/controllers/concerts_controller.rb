class ConcertsController < ApplicationController
	def index
      	@FechaActual = Date.current.year.to_s + "-" + format('%02d', Date.current.month).to_s + "-" + format('%02d', (Date.current.day)).to_s;
        @concerts = Concert.select("id, band, venue, city, date, price, description").where(:date => @FechaActual)
        #@concerts = Concert.all
        
        @DiaSiguiente = Date.current.year.to_s + "-" + format('%02d', Date.current.month).to_s + "-" + format('%02d', (Date.current.day+1)).to_s;
        @DiaFinalMes = Date.current.year.to_s + "-" + format('%02d', Date.current.month).to_s + "-31";
        @concertsRestantesMes = Concert.select("id, band, venue, city, date, price, description").where(date: @DiaSiguiente .. @DiaFinalMes)

        @concertsLikes = Concert.select("id, band, venue, city, date, price, description, likes").order("likes DESC").limit(10)

  end

  def show
      @concerts = Concert.find(params[:id])
  end

  def new
   		@concert = Concert.new
  end

  def edit
  		@concert = Concert.find(params[:id])
	end

  def create
      @concert = Concert.new(concert_params)
      if @concert.save
        redirect_to concert_path(@concert)
      else
        render :new
      end   
  end

  def update
 		@concert = Concert.find(params[:id])
    @concert.update(concert_params)
    if @concert.save
        redirect_to concert_path(@concert)
    else
        render :new
    end
	end

	def destroy
        @concert = Concert.find(params[:id])
        @concert.destroy
        redirect_to root_path
  end

  def like
    @concert = Concert.find(params[:id])
    @concert.likes = @concert.likes + 1;
    @concert.save
     
    @concerts = Concert.find(params[:id])
    render :show   
  end

  	private
    def concert_params
        params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
    end
end
