class LessonsController < ApplicationController
 
  def new
    @lesson = Lesson.new
   
    @serie_id = params[:serie_id]
  end

  def create 

    @lesson = Lesson.new(title: lessons_params[:title], description: lessons_params[:description], video_url: lessons_params[:video_url], 
   serie_id: params[:serie_id] )
  if @lesson.save 
   redirect_to lessons_new_path(@lesson), notice: "Aulacriada com sucesso!"
  else 
   render :new
  end 

    puts @lesson

    puts @lesson.title
    puts @lesson.save!
  
    puts @lesson.id
    


  end

  def show
    @lesson = Lesson.find_by_id(params[:lesson_id])
  end
  def delete
    @lesson = Lesson.find_by_id(params[:lesson_id])
    @lesson.destroy
    redirect_to "/series/#{@lesson.serie_id}"
  end

  private
  def lessons_params 
    params.require(:lesson).permit(:title, :description, :video_url, :serie_id)
  end
end