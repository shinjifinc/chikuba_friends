class QuestionnairesController < ApplicationController

  def index
    @company_ideas = CompanyIdea.order('rand()').take 4
  end

  def form_response
    # params[:stay_id]
    res = { contents: { } }
    company_ideas = CompanyIdea.order('rand()').take 4
    company_ideas.each_with_index do |company_idea, cnt|
      unless (cnt+1) == params[:stay_id]
        res[:contents].update("new_data#{cnt+1}" => "#{company_idea.idea}")
      end
    end

    render json: res
  end

end
