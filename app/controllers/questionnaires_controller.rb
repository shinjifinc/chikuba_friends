class QuestionnairesController < ApplicationController

  def index
  end

  def form_response
    # params[:stay_id]
    res = { contents: { } }
    4.times.each do |cnt|
      unless (cnt+1) == params[:stay_id]
        res[:contents].update("new_data#{cnt+1}" => "#{cnt}")
      end
    end

    render json: res
  end

end
