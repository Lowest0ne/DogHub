require 'spec_helper'

feature "an administrator is using the site" do

  scenario "I want to be able to see the comments", %Q{
    As an admin
    I want to be review contact inquries
    So that I can respond or take action
  }do
# Acceptance Criteria
#
# * I can see a list of all contact inquiries

  comment = Comment.create(
    email: 'schwope.carl@gmail.com',
    subject: 'I love this site',
    description: 'Can not get enough dogs',
    first_name: 'Carl',
    last_name: 'Schwope'
  )


  visit '/comments'
  page.should have_content('List of Comments')
  page.should have_content( comment.email )
  page.should have_content( comment.subject )
  page.should have_content( comment.description )
  page.should have_content( comment.first_name )
  page.should have_content( comment.last_name )

  end

end
