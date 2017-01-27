class MoviesController < ApplicationController
  def index
    (@movies =Movie.all)
  end

  def show
    id= params['id']
    @movie=Movie.find id
  rescue ActiveRecord::RecordNotFound
    @movie = nil
    render file: "#{Rails.root}/public/404.html", status: 404
  end

  def new
    @movie = Movie.new
  end

  def create
      @movie = Movie.new(movie_param)
      if  @movie.save
        redirect_to action: :show, id: @movie.id
      else
          render :new
      end

  end

  def movie_param
    params.require(:movie).permit(:title, :release_date, :description)
  end

  def edit

    id = params["id"]
    @movie = Movie.find (id)
  rescue ActiveRecord::RecordNotFound
    @movie = nil
    rende file: "#{Rails.root}/public/404.htmll"
  end

  def update
  begin
    id = params["id"]
    @movie = Movie.find (id)

      @movie.update(movie_param)
      if  @movie.save
        redirect_to action: :show, id: @movie.id
      else
          render :new
      end
    rescue ActiveRecord::RecordNotFound
      @movie = nil
      rende file: "#{Rails.root}/public/404.htmll"
    end

  end

  def delete
  begin
    id = params["id"]
    @movie = Movie.find (id)


      if  @movie.destroy
        redirect_to action: :index
      else
        redirect_to action: :show, id: @movie.id
    end
    rescue ActiveRecord::RecordNotFound
      @movie = nil
      rende file: "#{Rails.root}/public/404.htmll"
    end

  end



end
