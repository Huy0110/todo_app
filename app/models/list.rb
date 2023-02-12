class List < ApplicationRecord
    has_many :subtasks, dependent: :destroy
    def completed_subtasks_count
      subtasks.where(completed: true).count
    end
    has_many :list_comment, -> {order "created_at DESC"}
end
