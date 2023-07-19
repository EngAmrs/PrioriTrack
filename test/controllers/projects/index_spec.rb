require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @projects' do
      project1 = Project.create(name: 'Project 1')
      project2 = Project.create(name: 'Project 2')
      get :index
      expect(assigns(:projects)).to eq([project1, project2])
    end
  end
end