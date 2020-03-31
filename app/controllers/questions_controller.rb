class QuestionsController < ApplicationController
  def index
    temp = {}
    res = send_get_request temp,
                           'http://localhost:3001/questions'
    @questions = JSON.parse(res.body)
  end

  def new

  end

  def content
    obj = params.as_json
    obj[:user_id] = cookies.signed[:id]
    res = send_get_request obj,
                     'http://localhost:3001/question'

    @question =  JSON.parse( res.body )
    @vote = @question

  end

  def create
    obj = params.as_json
    obj[:id] = cookies.signed[:id]
    send_post_request( obj.to_json,
                  'http://localhost:3001/create_question')
    redirect_to root_path
  end


end
