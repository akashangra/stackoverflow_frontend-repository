class CommentsController < ApplicationController

    def create
      obj = params.as_json
      obj[:user_id] = cookies.signed[:id]
      send_post_request( obj.to_json,
                         'http://localhost:3001/create_comment')
      redirect_to root_path
    end
end
