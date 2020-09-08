# require 'rails_helper'

# RSpec.feature "Posts", type: :feature do

#   scenario "as a logged in user" do 
#     scenario "list all Posts" do
#       pending "add some scenarios (or delete) #{__FILE__}"
#     end

#     scenario "create a Post" do
#       pending "add some scenarios (or delete) #{__FILE__}"
#     end

#     scenario "edit a Post" do
#       pending "add some scenarios (or delete) #{__FILE__}"
#     end

#     scenario "delete a Post" do
#       pending "add some scenarios (or delete) #{__FILE__}"
#     end
#   end

#   scenario "as a logged out user" do 
#     scenario "list all Posts" do
#       pending "add some scenarios (or delete) #{__FILE__}"
#     end

#     scenario "create a Post" do
#       pending "add some scenarios (or delete) #{__FILE__}"
#     end

#     scenario "edit a Post" do
#       pending "add some scenarios (or delete) #{__FILE__}"
#     end

#     scenario "delete a Post" do
#       pending "add some scenarios (or delete) #{__FILE__}"
#     end
#   end
# end

require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  
  context "If user is signed-in" do
    
    let(:user) { User.create username: "endy", email: "endy@wearesnook.com", password: "password" }
    
    it 'saves and displays a post' do
      
      sign_in user
  
      visit new_post_path 
  
      fill_in 'Title', with: 'My first post'
      fill_in 'Body', with: 'This is my first post'
  
      click_on 'Create Post'
  
      expect(page).to have_content('My first post')
      expect(page).to have_content('This is my first post')
  
    end
  end

  context "If user is not signed-in" do

    let(:user) { User.create username: "endy", email: "endy@wearesnook.com", password: "password" }

    
    it "gets redirected to the login page" do
      sign_out user
      visit new_post_path 
      expect(page).to have_content('Log in')
    end
    
  end
  
  
end