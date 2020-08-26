require 'rails_helper'

RSpec.describe "Posts", type: :request do
		describe "GET /posts" do
			pending "write test code for the #index request"
		end

		describe "GET /posts/new" do
			# Given - Set the system into a specific state
			# When - Action is taken
			# Then - Result should be

			# Arrange - The system into a specific state
			# Act - Perform an action
			# Assert - The result

			it "returns a 200 status code" do
				get new_post_path
				expect(response).to be_successful
			end

      it "should render the new.html.erb template with a form" do
				# Given - Set the system into a specific state

				# When - Action is taken
        get new_post_path
				
				# Then - Result should be
				expect(response).to render_template('posts/new')
				expect(response).to render_template('posts/_form')
      end
		end

		context "with valid parameters" do
			describe "POST /posts" do
				pending "it returns a 201 status code"
				pending "it redirects to show page"
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
