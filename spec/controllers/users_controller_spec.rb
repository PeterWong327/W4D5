require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it "renders the sign up page" do
      get :new
      
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'POST #create' do 
    it "successfully creates a new user" do
      post :create, params: { user: {username: "Peter", password: "peterpeter" } }
      user = User.find_by(username: 'Peter')
      expect(session[:session_token]).to eq(user.session_token)
    end
    
    it "redirects a successful sign up to the new user's profile" do
      post :create, params: { user: {username: "Peter", password: "peterpeter" } }

      expect(response).to redirect_to( user_url(User.last) )
    end
    
    it "renders the sign up page on an unsuccessful sign up" do
      post :create, params: { user: {username: "Peter", password: "peter" } }
      
      expect(response).to render_template('new')
      expect(flash[:errors]).to be_present      
    end
  end
  
  describe 'GET #show' do
    it "displays the user's profile" do
      User.create!(username: "Peter", password: "peterpeter")
      get :show, params: { id: User.last.id }
      
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end 
  end
  
  describe 'GET #index' do
    it 'displays all users' do 
      get :index 
      
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end 
  end 
  
end
