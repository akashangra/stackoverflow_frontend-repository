module SessionsHelper
  def loggedIn?
    cookies[:remember_me]
  end
end
