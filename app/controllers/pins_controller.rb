class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :load_activities
	def index
		@search= Pin.search(params[:q])
		@pins = @search.result
		@pins = Pin.all.order(:cached_votes_up => :desc)
		if params[:tag]
			@pins = Pin.tagged_with(params[:tag])
		else
			@pins = Pin.all
		end
	end
	
	def page
		if params[:tag]
			@pins = Pin.tagged_with(params[:tag])
		else
			@pins = Pin.all
		end
	end

	def show
		@cs = C.where(pin_id: @pin)
		@search= Pin.search(params[:q])
		@pins = @search.result
	end
	def load_activities
  		@activities = PublicActivity::Activity.order('created_at DESC').limit(20)
	end
	

	def new
		@pin = current_user.pins.build
	end

	def create
		@user = current_user
		@pin = current_user.pins.build(pin_params)

		if @pin.save
				PostMailer.post_created(@user).deliver
			redirect_to @pin, notice: "Pin was successfully created"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@user = current_user
		if @pin.update(pin_params)
			PostMailer.post_updated(@user).deliver
			redirect_to @pin, notice: "Pin was successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@user = current_user
		PostMailer.post_destroy(@user).deliver

		@pin.destroy
		redirect_to root_path
	end

	def upvote
		@user = current_user
		PostMailer.post_upvote(@user).deliver
		UpvoteMailer.upvote_created(current_user,@pin.user).deliver
		@pin.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@user = current_user
		PostMailer.post_downvote(@user).deliver
		DownvoteMailer.downvote_created(current_user,@pin.user).deliver
		@pin.downvote_by current_user
		redirect_to :back
	end

	def download_File
		send_file image.attachment.path
	end
	def show2
		@user = current_user
	end
	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image, :mp3, :user_id, :tag_list)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end

end