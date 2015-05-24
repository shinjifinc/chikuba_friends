module Ubic
  class TeacherValue
    attr_accessor :teacher_id, :relevants
    
    def initialize(teacher_id, relevants = [])
      @teacher_id = teacher_id
      @relevants = relevants
    end
  end
end
