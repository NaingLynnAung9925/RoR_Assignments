class PostMailer < ApplicationMailer

  def post_confirmation(user,post)
    @user = user
    @post = post
    mail(:to => @user.email, :subject => "Post was successfully created")
  end

  def post_delete(user,post)
    @user = user
    @post = post
    mail(:to => @user.email, :subject => "Post was successfully deleted")
  end

  def post_list(user,posts)
    @user = user
    @posts = posts
    mail(:to => @user.email, :subject => "All of your Post List")
  end

end
