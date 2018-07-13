require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:cheers_remaining) }
    it { should validate_presence_of(:session_token) }
    
    it { should validate_uniqueness_of(:username) }
    
    it { should validate_length_of(:password).is_at_least(8) }
    it { should validate_numericality_of(:cheers_remaining).
      is_less_than(13) }
  end 
  
  describe "associations" do
    it { should have_many(:goals) }
    it { should have_many(:cheers) }
    it { should have_many(:comments) }
  end
  
  describe "authentication_methods" do 
    before(:each) do 
      User.create!(username: 'best_user', password: 'best_user')
    end
    
    describe "::find_by_credentials" do
      it 'finds user with correct password' do 
        expect(User.find_by_credentials('best_user', 'best_user')).to eq(User.find_by(username: 'best_user'))
      end 
      it 'returns nil if password is incorrect' do
        expect(User.find_by_credentials('best_user', 'worst_user')).to be_nil
      end 
    end 
  
  end 
end
