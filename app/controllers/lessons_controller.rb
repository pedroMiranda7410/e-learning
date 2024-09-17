class LessonsController < ApplicationController
 
  def new
    @lesson = Lesson.new
  end

  def create 
    @lesson = current_serie.lessons.build(lessons_params)
      if @lesson.save 
        redirect_to @current_serie, notice: "Aula criada com sucesso!"
      else 
        render :new, alert: "Erro ao criar aula"
      end
  end

  def show
    @lesson = Lesson.find_by_id(params[:lesson_id])
  end

  private
  def lessons_params 
    params.require(:lesson).permit(:title, :description, :video_url, :serie_id)
  end
end