class QuestionsController < ApplicationController
  def index
    temp = {}
    res = send_get_request temp,
                           'http://localhost:3001/questions'
    @questions = JSON.parse(res.body)
    puts @questions
  end

  def new

  end

  def content
    puts "in content"
    obj = params.as_json
    obj[:user_id] = cookies.signed[:id]
    res = send_get_request obj,
                     'http://localhost:3001/question'

    puts "response =="
    puts res.body.as_json
    @question =  JSON.parse( res.body )
    @vote = @question
    #@vote[:question_id]=@question[:id]
    #@vote[:like_count] = @question[:like_count];
    #@vote[:dislike_count] = @question[:dislike_count];
    #@vote[:current_vote_sign] = @question[:current_vote_sign];
    #@vote[:current_vote_id] = @question[:current_vote_id];

  end

  def create
    obj = params.as_json
    obj[:id] = cookies.signed[:id]
    send_post_request( obj.to_json,
                  'http://localhost:3001/create_question')
    redirect_to root_path
  end


end
