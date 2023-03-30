json.extract! commande, :id, :utilisateur_id, :chantier_id, :ressource_id, :date_de_commande, :date_de_livraison, :livre, :created_at, :updated_at
json.url commande_url(commande, format: :json)
