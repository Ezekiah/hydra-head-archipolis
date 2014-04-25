class CreateStudyController < ApplicationController
  def index
    @studies = Study.all
  end
  
  def new
    
  end
  
  
end
