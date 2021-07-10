require "application_system_test_case"

class ParticipantsTest < ApplicationSystemTestCase
  setup do
    @participant = participants(:one)
  end

  test "visiting the index" do
    visit participants_url
    assert_selector "h1", text: "Participants"
  end

  test "creating a Participant" do
    visit participants_url
    click_on "New Participant"

    check "Agreement" if @participant.agreement
    fill_in "Cont amount", with: @participant.cont_amount
    fill_in "Eth adress", with: @participant.eth_adress
    fill_in "Eth tx", with: @participant.eth_tx
    fill_in "Familyname", with: @participant.familyname
    fill_in "Firstname", with: @participant.firstname
    check "Kyc approved" if @participant.kyc_approved
    check "Privacy agr" if @participant.privacy_agr
    fill_in "User", with: @participant.user_id
    click_on "Create Participant"

    assert_text "Participant was successfully created"
    click_on "Back"
  end

  test "updating a Participant" do
    visit participants_url
    click_on "Edit", match: :first

    check "Agreement" if @participant.agreement
    fill_in "Cont amount", with: @participant.cont_amount
    fill_in "Eth adress", with: @participant.eth_adress
    fill_in "Eth tx", with: @participant.eth_tx
    fill_in "Familyname", with: @participant.familyname
    fill_in "Firstname", with: @participant.firstname
    check "Kyc approved" if @participant.kyc_approved
    check "Privacy agr" if @participant.privacy_agr
    fill_in "User", with: @participant.user_id
    click_on "Update Participant"

    assert_text "Participant was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant" do
    visit participants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant was successfully destroyed"
  end
end
