class VotesController < ApplicationController

  def create
    obj = params.as_json
    obj[:user_id] = cookies.signed[:id]
    send_post_request( obj.to_json,
                       'http://localhost:3001/create_vote')
    redirect_to root_path
  end

  def update
    send_post_request( params.to_json,
                       'http://localhost:3001/update_vote')
    redirect_to root_path
  end

  def destroy
    send_post_request( params.to_json,
                       'http://localhost:3001/delete_vote')
    redirect_to root_path
  end

end
