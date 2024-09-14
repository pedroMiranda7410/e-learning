class SeriesController < ApplicationController
  #before_action :authenticate_user! (ação já feita na aplicattion_controller)
  before_action :require_instructor, only: [:new, :create, :index] 
  def index
    @series = Serie.all 
  end

  def new
    @serie = Serie.new
  end
    
  def create 
    params = {
      serie: {
        title: "meu titulo",
        description: "Minhas descricao",
        image_url: "www.google.com/image"
      }
    }

    @serie = current_user.series.build(series_params)

    @serie = Serie.new(
      title: params[:serie][:title],
      description: params[:serie][:description],
      image_url: params[:serie][:image_url],
      user_id: current_user.id
    )

    if current_user.is_instructor? && @serie.save 
      redirect_to @serie, notice: "Serie criada com sucesso!"
    else
      render :new
    end
  end

  def show 
    @serie = Serie.find_by_id(params[:serie_id])
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
