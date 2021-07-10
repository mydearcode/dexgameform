json.extract! participant, :id, :firstname, :familyname, :kyc_approved, :agreement, :privacy_agr, :eth_adress, :cont_amount, :eth_tx, :user_id, :created_at, :updated_at
json.url participant_url(participant, format: :json)
