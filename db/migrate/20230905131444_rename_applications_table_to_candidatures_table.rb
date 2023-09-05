class RenameApplicationsTableToCandidaturesTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :time_slots, :application, foreign_key: true
    rename_table :applications, :candidatures
    add_reference :time_slots, :candidature, foreign_key: true
  end
end
