require 'spec_helper'

feature "an administrator is using the site" do

  before(:each) do

    @comment = Comment.create(
      email: 'schwope.carl@gmail.com',
      subject: 'I love this site',
      description: 'Can not get enough dogs',
      first_name: 'Carl',
      last_name: 'Schwope'
    )


    visit '/comments'
    page.should have_content('List of Comments')

  end


  scenario "I want to be able to see the comments", %Q{
    As an admin
    I want to be review contact inquries
    So that I can respond or take action
  }do
# Acceptance Criteria
#
# * I can see a list of all contact inquiries

    page.should have_content( @comment.email )
    page.should have_content( @comment.subject )
    page.should have_content( @comment.description )
    page.should have_content( @comment.first_name )
    page.should have_content( @comment.last_name )

  end

  scenario "I want to be able to delete a comment", %Q{
    As an admin
    I want to be able to delete a comment
    So I can see the sections of the page below the comments
  }do
# Acceptance Criteria
#
# * I can remove an item from the list of comments
    prev_count = Comment.count

    click_link 'Delete'

    page.should_not have_content( @comment.email )
    page.should_not have_content( @comment.subject )
    page.should_not have_content( @comment.description )
    page.should_not have_content( @comment.first_name )
    page.should_not have_content( @comment.last_name )

    expect( prev_count ).to eql( Comment.count + 1 )

  end
end
