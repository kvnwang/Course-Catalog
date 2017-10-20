class CreateSubjectToCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :subject_to_courses do |t|
      t.integer :course_id
      t.string :subject_id

      t.timestamps
    end
  end
end
