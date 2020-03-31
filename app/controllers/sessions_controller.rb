class SessionsController < ApplicationController
  def new
  end
  def login

    obj = params.to_json
    response = Net::HTTP.post URI('http://localhost:3001/login'),
                              obj,
                   "Content-Type" => "application/json"
    obj = JSON.parse(response.body)

    cookies.permanent.signed[:id] = obj["id"]
    cookies.permanent[:remember_me] = obj["remember_me"]

    obj["remember_me"] = cookies[:remember_me]
    obj["id"] = cookies.signed[:id]

    puts "sending again"

    response = Net::HTTP.post URI('http://localhost:3001/login'),
                              obj.to_json,
                              "Content-Type" => "application/json"

    redirect_to questions_index_path


  end

  def logout
    cookies.delete(:remember_me)
    cookies.delete(:id)
    redirect_to root_path
  end

end
