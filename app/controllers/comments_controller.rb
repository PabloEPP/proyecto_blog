class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    respond_to do |format|
      @post = Post.find(params[:post_id])
  		@comment = @post.comments.create(params[:comment].permit(:name, :body))

  		#redirect_to post_path(@post)
     if @comment.save
       format.html { redirect_to @post, notice: 'Comentario creado con éxito.' }
       format.json { render :show, status: :created, location: @post }
       format.js{  render :create, status: :created }
     else
       format.html { render :new }
       format.json { render json: @post.errors, status: :unprocessable_entity }
       format.js{ render :error, status: :unprocessable_entity }
     end
   end


	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

  private

	def comment_params
		params.require(:comment).permit(:title, :body)
	end
end
