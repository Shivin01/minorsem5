class DownvoteMailer < ActionMailer::Base

def downvote_created(current_user,pin_user)
	@current_user = current_user
	@pin_user = pin_user

	mail(to: pin_user.email, 
		 from: "services@mydomain.com",
		 subject: "Post Disliked",
		 
	     )
	end

end