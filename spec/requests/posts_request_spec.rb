require 'rails_helper'

RSpec.describe "Posts", type: :request do
		describe "GET /posts" do
			pending "write test code for the #index request"
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

		context "with valid parameters" do
			describe "POST /posts" do
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
		end

		context "with invalid parameters" do
			describe "POST /posts" do
				pending "it returns a 400 status code"
				pending "it redirects to new page"
			end
		end

		describe "GET /posts/:id" do
			pending "it returns a 200 status code"
			pending "it should render the show.html.erb template"
		end
end
