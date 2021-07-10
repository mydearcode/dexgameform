require "test_helper"

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get participants_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_url
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post participants_url, params: { participant: { agreement: @participant.agreement, cont_amount: @participant.cont_amount, eth_adress: @participant.eth_adress, eth_tx: @participant.eth_tx, familyname: @participant.familyname, firstname: @participant.firstname, kyc_approved: @participant.kyc_approved, privacy_agr: @participant.privacy_agr, user_id: @participant.user_id } }
    end

    assert_redirected_to participant_url(Participant.last)
  end

  test "should show participant" do
    get participant_url(@participant)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_url(@participant)
    assert_response :success
  end

  test "should update participant" do
    patch participant_url(@participant), params: { participant: { agreement: @participant.agreement, cont_amount: @participant.cont_amount, eth_adress: @participant.eth_adress, eth_tx: @participant.eth_tx, familyname: @participant.familyname, firstname: @participant.firstname, kyc_approved: @participant.kyc_approved, privacy_agr: @participant.privacy_agr, user_id: @participant.user_id } }
    assert_redirected_to participant_url(@participant)
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete participant_url(@participant)
    end

    assert_redirected_to participants_url
  end
end
