class LessonsController < ApplicationController
 
  def new
    @lesson = Lesson.new
    
    @serie = Serie.find_by_id(params[:serie_id])
    @serie_id = @serie.id

    redirect_to root_path, alert: "Acesso não autorizado" unless current_user == @serie.user
  end

  def create 
    @lesson = Lesson.new(title: lessons_params[:title], description: lessons_params[:description], video_url: lessons_params[:video_url], serie_id: params[:serie_id] )
   
    if @lesson.save 
      redirect_to "/series/#{ @lesson.serie_id }", notice: "Aulacriada com sucesso!"
    else 
      render :new
    end 
  end

  def show
    @lesson = Lesson.find_by_id(params[:id])
    @comments = @lesson.comments
  end

  def destroy
    @lesson = Lesson.find_by_id(params[:id])
    @lesson.destroy

    redirect_to "/series/#{@lesson.serie_id}"
  end

  private
  def lessons_params 
    params.require(:lesson).permit(:title, :description, :video_url, :serie_id)
  end
end