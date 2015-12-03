class HomesController < ApplicationController
  def show
  	@search= Pin.search(params[:q])
	@pins = @search.result
  end
  private

	def pin_params
		params.require(:pin).permit(:title, :description, :image, :user_id, :tag_list)
	end
end
