module SessionsHelper
  #VOTE_SIGN_UP = 1
  #VOTE_SIGN_DOWN = 2

  def loggedIn?
    cookies[:remember_me]
  end

  def send_post_request(data,url)
    Net::HTTP.post URI(url),
                   data,
                   "Content-Type" => "application/json"
  end

  def send_get_request(hash_data,url)
    uri = URI(url)
    uri.query = URI.encode_www_form(hash_data)
    res = Net::HTTP.get_response(uri)

  end

  def vote_sign_up
    1
  end

  def vote_sign_down
    2
  end

end
