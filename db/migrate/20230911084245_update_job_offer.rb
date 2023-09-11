class UpdateJobOffer < ActiveRecord::Migration[7.0]
  def change
    # Supprimer la colonne 'industry' de la table 'job_offers'
    remove_column :job_offers, :industry, :string

    # Ajouter la colonne 'status' à la table 'job_offers'
    add_column :job_offers, :status, :string, default: 'Publiée'

    # Ajouter la colonne 'deadline' à la table 'job_offers' avec le type 'date'
    add_column :job_offers, :deadline, :date

    # Changer le type de la colonne 'contract_type' à la table 'job_offers'
    # Vous devrez peut-être ajuster les valeurs possibles en fonction de vos besoins
    change_column :job_offers, :contract_type, :string

    # Ajouter la colonne 'salaire' (remplacez 'salaire' par le nom de votre colonne salaire si nécessaire)
    add_column :job_offers, :salaire, :integer
  end
end
