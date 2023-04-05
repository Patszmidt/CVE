json.extract! commande, :id, :date, :fournisseur_id, :numero_de_commande, :livree, :created_at, :updated_at
json.url commande_url(commande, format: :json)
