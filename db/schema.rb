# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160725082344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lesson_parts", force: :cascade do |t|
    t.string   "name"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_parts_on_lesson_id", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id"
    t.index ["school_id"], name: "index_lessons_on_school_id", using: :btree
  end

  create_table "school_class_students", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "school_class_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["school_class_id"], name: "index_school_class_students_on_school_class_id", using: :btree
    t.index ["student_id"], name: "index_school_class_students_on_student_id", using: :btree
  end

  create_table "school_class_teachers", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "school_class_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["school_class_id"], name: "index_school_class_teachers_on_school_class_id", using: :btree
    t.index ["teacher_id"], name: "index_school_class_teachers_on_teacher_id", using: :btree
  end

  create_table "school_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id"
    t.index ["school_id"], name: "index_school_classes_on_school_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sequences", force: :cascade do |t|
    t.string   "sequenceable_type"
    t.integer  "sequenceable_id"
    t.integer  "sequence_ids",                   array: true
    t.string   "sequence_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "identifier"
    t.index ["identifier"], name: "index_sequences_on_identifier", using: :btree
    t.index ["sequence_ids"], name: "index_sequences_on_sequence_ids", using: :gin
    t.index ["sequenceable_id"], name: "index_sequences_on_sequenceable_id", using: :btree
    t.index ["sequenceable_type"], name: "index_sequences_on_sequenceable_type", using: :btree
  end

  create_table "student_progresses", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "lesson_part_id"
    t.integer  "lesson_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["lesson_id"], name: "index_student_progresses_on_lesson_id", using: :btree
    t.index ["lesson_part_id"], name: "index_student_progresses_on_lesson_part_id", using: :btree
    t.index ["student_id"], name: "index_student_progresses_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "school_id"
    t.integer  "lesson_part_id"
    t.index ["lesson_part_id"], name: "index_students_on_lesson_part_id", using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lesson_parts", "lessons"
  add_foreign_key "school_class_students", "school_classes"
  add_foreign_key "school_class_students", "students"
  add_foreign_key "school_class_teachers", "school_classes"
  add_foreign_key "school_class_teachers", "teachers"
  add_foreign_key "student_progresses", "lesson_parts"
  add_foreign_key "student_progresses", "lessons"
  add_foreign_key "student_progresses", "students"
end
