class CommentsController < ApplicationController

    def create
      obj = params.as_json
      obj[:user_id] = cookies.signed[:id]
      send_post_request( obj.to_json,
                         'http://localhost:3001/create_comment')
      get_comments
      render 'comment'
    end

    def get_comments

      res = send_get_request params.to_unsafe_h,
                             'http://localhost:3001/comments_from_question'
      @comments = JSON.parse(res.body)

    end

    def comment
      get_comments
    end
end
