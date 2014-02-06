class StudyStepsController < ApplicationController
  
  include Wicked::Wizard
  steps :etape1, :etape2, :etape3
  
   def show
    @study = Study.find(session[:study_id])
    render_wizard
  end
  
  def update
    @study = Study.find(session[:study_id])
    @study.attributes = params[:study]
    render_wizard @study
  end
  
  
  
    
  
private

  #def redirect_to_finish_wizard
   # redirect_to root_url, notice: "Thank you for signing up."
  #end

  
end
