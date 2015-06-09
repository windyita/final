class UserNotifier < ApplicationMailer
  default :from => 'piazza.test.123@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def signup_email(user)
    @user = user
    @url = 'http://localhost:3000/signup'
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for piazza!' )
  end
end

