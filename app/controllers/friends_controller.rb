class FriendsController < ApplicationController



def create
	@friend = current_user.friends.build(:friend_id => params[:friend_id])
	
	if @friend.save
	    flash[:notice] = "Added friend."
	    redirect_to root_url
	else
	    flash[:error] = "Unable to add friend."
	    redirect_to root_url
	end
end
def edit
	@friends = current_user.friends
end
def destroy
  @friend= current_user.friends.find(params[:id])
  @friend.destroy
  flash[:notice] = "Removed friendship."
  redirect_to current_user
end

end
