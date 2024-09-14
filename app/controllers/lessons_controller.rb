class LessonsController < ApplicationController

  def new
  end 

  def create
    lesson = Lesson.new(
      title: params[:lesson][:title],
      description: params[:lesson][:description],
      image_url: params[:lesson][:image_url],
      video_url: params[:lesson][:video_url],
      content: params[:lesson][:content]
    )

    lesson.save 

  end 
end