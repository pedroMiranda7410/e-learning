class SeriesController < ApplicationController
  #before_action :authenticate_user!
  #before_action :require_instructor, only: [:new, :create]
  def index
    @series = Serie.all 

  #  if current_user.instrutor
  #    render 'index_instrutor'
  #  else 
  #    render 'index_aluno' 
  end

  def new
      @serie = Serie.new
  end
    
  def create 
    @serie = current_user.serie.build(series_params)
    if @serie.save
      redirect_to @serie, notice: "Serie criada com sucesso!"
    else
      render :new
    end
  end

  def series_params
    params.require(:series).permit(:title, :description, :image_url, :user_id)
  end

  def require_instructor 
    unless current-user.instructor
      redirect_to root_parth, alert: "Acesso negado!"
    end
  end
end
