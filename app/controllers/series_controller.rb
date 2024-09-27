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
    puts @lessons  
    puts '------------------------'
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
