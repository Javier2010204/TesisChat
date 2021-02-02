class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @jobs_pending = JobApplication.pending.where(professional_id: current_user.id)
        @jobs_active = JobApplication.active.where(professional_id: current_user.id)
    end
    
end
