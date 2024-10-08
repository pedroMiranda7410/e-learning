class SeriesController < ApplicationController
  before_action :require_instructor, only: [:new, :create, :index] 
  def index
    @series = current_user.series
  end

  def new
    @serie = Serie.new
  end
    
  def create 
    @serie = current_user.series.build(series_params)
    
    if current_user.is_instructor? && @serie.save 
      redirect_to @serie, notice: "Serie criada com sucesso!"
    else
      render :new
    end
  end

  def show 
    @serie = Serie.find_by_id(params[:serie_id])
    @lessons = @serie.lessons 
  end

  private 
    def series_params
      params.require(:serie).permit(:title, :description, :image_url, :user_id)
    end

    def require_instructor 
      unless current_user.is_instructor?
        redirect_to root_path, alert: "Acesso negado!"
      end
    end
end
