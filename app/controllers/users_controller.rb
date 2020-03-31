class UsersController < ApplicationController

  def new
  end

  def create

    Net::HTTP.post URI('http://localhost:3001/signup'),
                   params.to_json,
                   "Content-Type" => "application/json"
    redirect_to login_path
  end

  def edit
    @user_id=params[:id]

    uri = URI("http://localhost:3001/user/data")
    uri.query = URI.encode_www_form(params.to_unsafe_h )

    res = Net::HTTP.get_response(uri)
    @json_res = JSON.parse( res.body )

  end

  def update

    obj = params.to_json
    response = Net::HTTP.post URI('http://localhost:3001/user/update'),
                              obj,
                              "Content-Type" => "application/json"
  end

end
