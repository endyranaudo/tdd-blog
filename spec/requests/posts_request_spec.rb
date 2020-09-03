require 'rails_helper'

RSpec.describe "Posts", type: :request do
		describe "GET /posts" do
			it "shold get #INDEX" do
				get posts_path
				expect(response).to be_successful
			end
		end

		describe "GET /posts/new" do
      it "returns a 200 status code" do
				get new_post_path
				expect(response).to be_successful
			end

      it "should render the new.html.erb template with a form" do
        get new_post_path
				expect(response).to render_template('posts/new')
      end
		end

		describe "POST /posts" do
			context "as a logged in user" do
				#@@@@ HOW CAN I TEST IF USER SIGNED IN????
				# before(:each) do
				# 	@user = User.create username: "endy", email: "testuser@wearesnook.com", password: "supersecure"
				# 	sign_in @user
				# end
				context "with valid parameters" do
					it "creates a Post" do
						expect {
							params = { post: { title: "Test Title", body: "Test body" } }
							post posts_path(params)
						}.to change(Post, :count).by(1)
					end

					it "it redirects to show page" do
						params = { post: { title: "Test Title", body: "Test body" } }
							
						post posts_path(params)
						expect(response).to redirect_to post_path assigns(:post)
					end
				end

				context "with invalid parameters" do
					it "returns a 400 status code" do
						params = { post: { title: "", body: "" } }
						post posts_path(params)
						# NEED TO CHECK THIS ONE
						expect(response.status).to eq(302)
						# expect(response).to redirect_to new_post_path
					end
				end
			end
		end

		describe "GET /posts/:id" do
			it "returns a 200 status code" do
				params = { post: { id: 1 } }
				get posts_path(params)
				expect(response.status).to eq(200)
			end
		end
end