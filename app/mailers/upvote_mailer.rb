class UpvoteMailer < ActionMailer::Base

def upvote_created(current_user,pin_user)
	@current_user = current_user
	@pin_user = pin_user

	mail(to: pin_user.email, 
		 from: "services@mydomain.com",
		 subject: "Post Created",
		 
	     )
	end

end