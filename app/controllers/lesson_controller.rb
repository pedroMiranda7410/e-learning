class LessonController < ApplicationController
 
  def new
    @lesson = Lesson.new
  end

  def create 
    @lesson = current_serie.lesson.build (lesson_params)
    render 'new'
  end

  def show
    @lesson = Lesson.find_by_id(params[:lesson_id])
  end

  private
  def lesson_params 
    params.require(:lesson).permit(:title, :description, :video_url, :serie_id)
  end
end