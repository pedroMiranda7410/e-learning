
class CommentsController < ApplicationController
    before_action :set_lesson, only: [:new, :create]
    
    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(comments_params)
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to lesson_path(@comment.lesson_id), notice: 'Comentario criado com sucesso.'
      else
        render lesson_path(params[:comment][:lesson_id])
      end
    end

    private
      def set_lesson
        @lesson = Lesson.find_by_id(params[:lesson_id])
      end
      
      def comments_params
        params.require(:comment).permit(:content, :user_id, :lesson_id)# Adjust according to your model
      end

end
   


    

