require 'rails_helper'

RSpec.describe "Project Routes", type: :request do
  let(:user) { create(:user) }  

  describe "GET /projects" do
    it "returns an empty array of projects when logged in" do
      sign_in user
      get '/projects.json'
      expect(JSON.parse(response.body)).to eql([])
    end

    it "redirects to login when not logged in" do
      get '/projects'
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /projects" do
    it "creates a project when logged in" do
      sign_in user

      # Using FactoryBot to create project_params
      project_params = attributes_for(:project, user: user).merge(title: "dsadsa")
      post '/projects', params: { project: project_params }, as: :json

      expect(JSON.parse(response.body)).to  include(
        "id" => an_instance_of(Integer),
        "title" => project_params[:title],
        "created_at" => an_instance_of(String),
        "updated_at" => an_instance_of(String),
        "user_id" => user.id
      )
    end

    it "redirects to login when not logged in" do
      post '/projects'
      expect(response).to have_http_status(302)
    end
  end

  describe "edit /projects" do
    it "edit a project when logged in" do
      sign_in user

      # Using FactoryBot to create project_params
      project_params = attributes_for(:project, user: user).merge(title: "amr")

      # create Project
      post '/projects', params: { project: project_params }, as: :json
      created_project_id = JSON.parse(response.body)["id"]

      patch "/projects/#{created_project_id}", params: { project: project_params }, as: :json

      expect(JSON.parse(response.body)).to  include(
        "id" => an_instance_of(Integer),
        "title" => project_params[:title],
        "created_at" => an_instance_of(String),
        "updated_at" => an_instance_of(String),
        "user_id" => user.id
      )
    end

    it "redirects to login when not logged in" do
      project_id_to_edit = 1
      patch "/projects/#{project_id_to_edit}"
      expect(response).to have_http_status(302)
    end
  end

  describe "destroy /projects" do
    it "destroy a project when logged in" do
      sign_in user

      # Using FactoryBot to create project_params
      project_params = attributes_for(:project, user: user).merge(title: "amr")

      # create Project
      post '/projects', params: { project: project_params }, as: :json
      created_project_id = JSON.parse(response.body)["id"]

      delete "/projects/#{created_project_id}"

      expect(response).to have_http_status(302)
    end

    it "redirects to login when not logged in" do
      get "/projects"
      expect(response).to have_http_status(302)
    end
  end
end
