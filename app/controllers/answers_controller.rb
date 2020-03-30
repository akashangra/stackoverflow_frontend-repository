class AnswersController < ApplicationController

  def create

    obj = params.as_json
    obj[:user_id] = cookies.signed[:id]
    send_post_request( obj.to_json,
                       'http://localhost:3001/create_answer')


    res = send_get_request params.to_unsafe_h,
                           'http://localhost:3001/answers_from_question'
    @answers = JSON.parse(res.body)
    @answers = @answers.paginate(:page => params[:page], :per_page => 2)

    render 'answer_button'
  end


  def answer_button
    res = send_get_request params.to_unsafe_h,
                           'http://localhost:3001/answers_from_question'
    @answers = JSON.parse(res.body)
    @answers = @answers.paginate(:page => params[:page], :per_page => 2)

  end


end
