class List < ApplicationRecord
    has_many :subtasks
    
    def completed_subtasks_count
      subtasks.where(completed: true).count
    end
end
