class VotesController < ApplicationController

  def create
    obj = params.as_json
    obj[:user_id] = cookies.signed[:id]
    res = send_post_request( obj.to_json,
                       'http://localhost:3001/create_vote')

    @vote = JSON.parse(res.body)
  end

  def update
    res = send_post_request( params.to_json,
                       'http://localhost:3001/update_vote')
    @vote = JSON.parse(res.body)
  end

  def destroy
    res = send_post_request( params.to_json,
                       'http://localhost:3001/delete_vote')
    @vote = JSON.parse(res.body)
  end

end
