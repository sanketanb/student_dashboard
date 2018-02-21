class School < ActiveRecord::Base
    has_many :students
    validates :branch, :state, presence: true
    before_destroy :remove_enrolled_students

    def remove_enrolled_students
        self.students.destroy_all
        # note: we need to do School.first.destroy and not delete since we have before_destroy defined
        # note2: we use before_destory so we have the school id while deleting ninjas
    end

end
