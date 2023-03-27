json.extract! utilisateur, :id, :prenom, :nom, :created_at, :updated_at
json.url utilisateur_url(utilisateur, format: :json)
