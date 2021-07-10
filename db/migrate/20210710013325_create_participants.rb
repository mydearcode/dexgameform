class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :firstname, nil: false
      t.string :familyname, nil: false
      t.boolean :kyc_approved, default:false
      t.boolean :agreement, default:false
      t.boolean :privacy_agr, default:false
      t.string :eth_adress, nil: false
      t.integer :cont_amount, default: 0
      t.string :eth_tx, nil: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
