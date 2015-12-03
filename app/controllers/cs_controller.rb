class CsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@user = current_user
		@pin = Pin.find(params[:pin_id])
		@c = C.create(params[:c].permit(:content))
		@c.user_id =  current_user.id
		@c.pin_id = @pin.id

		if @c.save
			CommentMailer.comment_created(current_user,@pin.user,@c.content).deliver
			PostMailer.post_comment(@user).deliver
			redirect_to pin_path(@pin)
		else
			render 'new'
		end
	end
end

