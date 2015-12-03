class PostMailer < ActionMailer::Base

	def post_created(user)

		mail(to: user.email, 
			from: "services@mydomain.com",
			subject: "Post Created",
			body: "You have Created a post. Thankyou for choosing Unplug"
			)
	end

	def post_updated(user)
			mail(to: user.email, 
				from: "services@mydomain.com",
				subject: "Unplug Post Update",
				body: "Your Post has been Updated"
			)
	end

	def post_destroy(user)
		mail(to: user.email, 
				from: "services@mydomain.com",
				subject: "Post Destroy",
				body: "Your Post has been Deleted"
			)
	end

	def post_upvote(user)
		mail(to: user.email, 
				from: "services@mydomain.com",
				subject: "Post Liked by you",
				body: "You have liked a post"
			)
	end

	def post_comment(user)
		mail(to: user.email, 
				from: "services@mydomain.com",
				subject: "Comment Created",
				body: "You have commented on a post"
			)
	end

	def post_downvote(user)
		mail(to: user.email, 
				from: "services@mydomain.com",
				subject: "Post disliked by you",
				body: "You have disliked a post"
			)
	end

end