class QuestionsController < ApplicationController
  def index
  end

  def new

  end

  def content
    puts "in content"
    res = send_get_request params.to_unsafe_h,
                     'http://localhost:3001/question'

    puts "response =="
    puts res.body.as_json
    @question =  JSON.parse( res.body )
  end

  def create
    obj = params.as_json
    obj[:id] = cookies.signed[:id]
    send_post_request( obj.to_json,
                  'http://localhost:3001/create_question')
    redirect_to root_path
  end

  def comment_button

  end

end
