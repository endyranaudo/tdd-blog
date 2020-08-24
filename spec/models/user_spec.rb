require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation test" do
    it "validates username presence" do
      user = User.new(email: 'endy@email.com', password: 'password').save
      expect(user).to eq(false)
    end

    it "validates email presence" do
      user = User.new(username: 'endy', password: 'password').save
      expect(user).to eq(false)
    end

    it "validates password presence" do
      user = User.new(username: 'endy', email: 'endy@email.com').save
      expect(user).to eq(false)
    end

    it "should save successfully" do
      user = User.new(username: 'endy', email: 'endy@email.com', password: 'password').save
      expect(user).to eq(true)
    end
    
  end

  context "scope test" do

    let (:params) { { username: 'endy', email: 'endy@email.com', password: 'password'}}
    
    before(:each) do
      User.new(params.merge(active: true)).save
      User.new(params.merge(active: false)).save
      User.new(params.merge(active: false)).save
    end

    it "should return active users" do
      # byebug
      expect(User.active_users.size).to eq(1)
    end

    it "should return active users" do
      expect(User.inactive_users.size).to eq(2)
    end
    
  end
  
  
end
