class UsersController < ApplicationController 
  	def create
    	@user = User.new(params[:user])
	 end
   def show
  @users = User.where('id NOT IN (:ids)' , ids: current_user.id)
   end
   
  def find_user
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
  end
end
 def profile
    @pins = current_user.pins
    @user = current_user
    
 end
 def show1
    
    @cs = C.where(pin_id: @pin)
    @search= Pin.search(params[:q])
    @pins = @search.result
  end

def user_params
  params.require(:user).permit(:thumbnail)
end

end
