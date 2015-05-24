module Ubic
  class Importer
    def initialize(category_id)
      @category_id = category_id
    end

    def import
      CompanyIdea.all.each do |company_idea|
        params = { 'documentId' => company_idea.id, 'categoryId' => @category_id, 'text' => company_idea.idea }
        json = HTTParty.post(Ubic::API_ENDPOINT, { body: params.to_json, headers: {'Content-Type' => 'application/json'} }).body
        result = JSON.parse json
        p result
      end
    end
  end
end
