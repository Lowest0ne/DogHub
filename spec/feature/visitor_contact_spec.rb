require 'spec_helper'

feature "visitor contacts DogHub staff", %Q{
    As a site visitor
    I want to contact DogHub staff
    So I can tell them how awesome they are
  }do

#   ACCEPTANCE CRITERIA
#
#   * I must specify a valid email address
#   * I must specify a subject
#   * I must specify a description
#   * I must specify a first name
#   * I must specify a last name

  scenario "I specify valid information" do
    contact_count = Comment.count

    visit '/comments'
    click_link 'Contact us'
    page.should have_content('Contact Us')

    fill_in 'Email', with: 'schwope.carl@gmail.com'
    fill_in 'Subject', with: 'So happy'
    fill_in 'Description', with: 'I finally have enough a satisfactory dog site'
    fill_in 'First Name', with: 'Carl'
    fill_in 'Last Name', with: 'Schwope'

    click_button 'Submit'

    page.should have_content('Thanks for the comment')
    expect( Comment.count ).to eql( contact_count + 1 )

  end

end
