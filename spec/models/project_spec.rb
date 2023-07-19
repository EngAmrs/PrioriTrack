require 'rails_helper'

RSpec.describe Project, type: :model do
    let(:user) { create(:user) }
  
    describe "validations" do
      it "is valid with a title that has at least 3 characters" do
        project = build(:project, user: user, title: "Test Project")
        expect(project).to be_valid
      end
  
      it "is invalid without a title" do
        project = build(:project, user: user, title: nil)
        expect(project).not_to be_valid
        expect(project.errors[:title]).to include("can't be blank")
      end
  
      it "is invalid with a title that has less than 3 characters" do
        project = build(:project, user: user, title: "Tt")
        expect(project).not_to be_valid
        expect(project.errors[:title]).to include("is too short (minimum is 3 characters)")
      end
    end
  
    describe "associations" do
      it "belongs to a user" do
        assoc = Project.reflect_on_association(:user)
        expect(assoc.macro).to eq(:belongs_to)
      end
  
      it "has many tasks" do
        assoc = Project.reflect_on_association(:tasks)
        expect(assoc.macro).to eq(:has_many)
      end
    end
  
    describe "before_destroy callback" do
      it "removes project_id from associated tasks when project is destroyed" do
        project = create(:project, user: user, title: "amr")
        task1 = Task.create(name: "test", project_id: project.id, user:user)
        task2 = Task.create(name: "test2", project_id: project.id, user:user)
  
        expect(task1.project_id).to eq(project.id)
        expect(task2.project_id).to eq(project.id)
  
        project.destroy
  
        task1.reload
        task2.reload
  
        expect(task1.project_id).to be_nil
        expect(task2.project_id).to be_nil
      end
    end
  end
  