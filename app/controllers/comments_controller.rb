class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: [:destroy, :edit]

	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
		redirect_to @comment.micropost
		else
			@micropost = current_micropost
			@comments = current_micropost.comments
			render 'microposts/show'
		end
	end

	#def edit
		#@comment = Comment.find_by(id: params[:id])
		#@micropost = current_micropost
		#@comments = current_micropost.comments
		#render 'micropost/show'
	#end


	def edit
		@micropost = current_micropost
		@comments = current_micropost.comments
		render 'microposts/show'	
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
		# Handle a successful update.
			redirect_to @comment.micropost
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to @comment.micropost
	end



	private
def comment_params
params.require(:comment).permit(:content, :micropost_id)
end

def correct_user
@comment = current_user.comments.find_by(id: params[:id])
end

end