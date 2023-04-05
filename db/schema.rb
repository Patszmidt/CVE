# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_05_121716) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achats", force: :cascade do |t|
    t.bigint "chantier_id", null: false
    t.bigint "ressource_id", null: false
    t.date "date_de_achat"
    t.date "date_de_livraison"
    t.boolean "livre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantite"
    t.string "commentaire"
    t.bigint "user_id"
    t.bigint "commande_id"
    t.index ["chantier_id"], name: "index_achats_on_chantier_id"
    t.index ["commande_id"], name: "index_achats_on_commande_id"
    t.index ["ressource_id"], name: "index_achats_on_ressource_id"
    t.index ["user_id"], name: "index_achats_on_user_id"
  end

  create_table "chantiers", force: :cascade do |t|
    t.string "nom"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_de_livraison"
    t.boolean "livre"
    t.index ["client_id"], name: "index_chantiers_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commandes", force: :cascade do |t|
    t.date "date"
    t.bigint "fournisseur_id", null: false
    t.string "numero_de_commande"
    t.boolean "livree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fournisseur_id"], name: "index_commandes_on_fournisseur_id"
  end

  create_table "fournisseurs", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matieres", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ressources", force: :cascade do |t|
    t.float "epaisseur"
    t.string "dimension"
    t.bigint "matiere_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "couleur"
    t.string "qualite"
    t.index ["matiere_id"], name: "index_ressources_on_matiere_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prenom"
    t.string "nom"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "prenom"
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "utilisations", force: :cascade do |t|
    t.bigint "chantier_id", null: false
    t.bigint "machine_id", null: false
    t.bigint "ressource_id", null: false
    t.date "date"
    t.integer "quantite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked", default: false
    t.bigint "user_id"
    t.index ["chantier_id"], name: "index_utilisations_on_chantier_id"
    t.index ["machine_id"], name: "index_utilisations_on_machine_id"
    t.index ["ressource_id"], name: "index_utilisations_on_ressource_id"
    t.index ["user_id"], name: "index_utilisations_on_user_id"
  end

  add_foreign_key "achats", "chantiers"
  add_foreign_key "achats", "commandes"
  add_foreign_key "achats", "ressources"
  add_foreign_key "achats", "users"
  add_foreign_key "chantiers", "clients"
  add_foreign_key "commandes", "fournisseurs"
  add_foreign_key "ressources", "matieres"
  add_foreign_key "utilisations", "chantiers"
  add_foreign_key "utilisations", "machines"
  add_foreign_key "utilisations", "ressources"
  add_foreign_key "utilisations", "users"
end
