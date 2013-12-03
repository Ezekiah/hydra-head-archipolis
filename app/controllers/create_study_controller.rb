class CreateStudyController < ApplicationController
  def index
    @studies = Study.all
  end
end
