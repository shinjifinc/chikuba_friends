module Ubic
  class Importer
    def initialize(category_id)
      @category_id = category_id
    end

    def import_document
      CompanyIdea.all.each do |company_idea|
        params = { 'documentId' => company_idea.id, 'categoryId' => @category_id, 'text' => company_idea.idea }
        json = HTTParty.post(Ubic::ENDPOINT_DOCUMENT, { body: params.to_json, headers: {'Content-Type' => 'application/json'} }).body
        result = JSON.parse json
        p result
      end
    end

    def import_teacher(data)
      data.each do |teacher_data|
        params = { 'teacherId' => teacher_data.teacher_id, 'categoryId' => @category_id, 'documents' => { 'relevant' => teacher_data.relevants } }
        json = HTTParty.post(Ubic::ENDPOINT_TEACHER, { body: params.to_json, headers: {'Content-Type' => 'application/json'} }).body
        result = JSON.parse json
        p result
      end
    end

    def leaning_result(data)
      data.each do |teacher_data|
        params = { 'teacherId' => teacher_data.teacher_id, 'categoryId' => @category_id }
        json = HTTParty.post(Ubic::ENDPOINT_LEANING, { body: params.to_json, headers: {'Content-Type' => 'application/json'} }).body
        result = JSON.parse json
        p result
      end
    end
  end
end
