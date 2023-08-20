class WebAppController < ApplicationController
    before_action :authenticate_user!

    def index
        @tasks = Task.includes(:project)
        .where(project_id: current_user.projects.pluck(:id))
        .or(Task.where(project_id: nil, user_id: current_user.id))
    end
end
