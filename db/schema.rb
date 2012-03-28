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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120328151105) do

  create_table "skills", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "skills_vacancies", :id => false, :force => true do |t|
    t.integer "vacancy_id"
    t.integer "skill_id"
  end

  add_index "skills_vacancies", ["skill_id"], :name => "index_skills_vacancies_on_skill_id"
  add_index "skills_vacancies", ["vacancy_id"], :name => "index_skills_vacancies_on_vacancy_id"

  create_table "skills_workers", :id => false, :force => true do |t|
    t.integer "worker_id"
    t.integer "skill_id"
  end

  add_index "skills_workers", ["skill_id"], :name => "index_skills_workers_on_skill_id"
  add_index "skills_workers", ["worker_id"], :name => "index_skills_workers_on_worker_id"

  create_table "vacancies", :force => true do |t|
    t.text     "name"
    t.integer  "lifetime"
    t.integer  "salary"
    t.string   "contacts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workers", :force => true do |t|
    t.text     "name"
    t.integer  "salary"
    t.string   "contacts"
    t.integer  "status_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
