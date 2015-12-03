class CommentMailer < ActionMailer::Base

def comment_created(current_user,pin_user,content)
	@current_user = current_user
	@pin_user = pin_user
	@content = content

	mail(to: pin_user.email, 
		 from: "services@mydomain.com",
		 subject: "Comment Created",
		 #body: "Smtp notification done"
	     )
	end

end