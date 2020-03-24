class UsersController < ApplicationController

  def new
  end

  def create
    puts params
    puts "======"
    puts params.to_json
    Net::HTTP.post URI('http://localhost:3001/signup'),
                   params.to_json,
                   "Content-Type" => "application/json"
  end

  def edit
    @user_id=params[:id]
    puts params.to_json

    uri = URI("http://localhost:3001/user/data")
    uri.query = URI.encode_www_form(params.to_unsafe_h )

    res = Net::HTTP.get_response(uri)
    @json_res = JSON.parse( res.body )
    puts @json_res
    #puts res.body if res.is_a?(Net::HTTPSuccess)

  end

  def update
    puts "in update method"
    puts params
    obj = params.to_json
    response = Net::HTTP.post URI('http://localhost:3001/user/update'),
                              obj,
                              "Content-Type" => "application/json"
  end

end
