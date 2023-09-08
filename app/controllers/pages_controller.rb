class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @job_offers = JobOffer.order(created_at: :desc).limit(5)
    @total_interviews = Interview.count
    @total_job_offers = JobOffer.count
    @interviews = Interview.all
  end

end
