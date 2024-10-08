
class CommentsController < ApplicationController
    before_action :set_lesson, only: [:new, :create]
    
    def new
        @comment = Comment.new 
        #@comment = @lesson.comments.build

        
    end

    def create
       @comment = Comment.new(comments_params)
       puts 50*
      
        if @comment.save
          redirect_to lesson_path(@comment.lesson_id), notice: 'Comentario criado com sucesso.'
        else
          render :new
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
   


    

