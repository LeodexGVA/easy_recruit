class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @job_offers = JobOffer.order(created_at: :desc).limit(5)
    @time_slots = TimeSlot.limit(3)
    @total_time_slots = TimeSlot.count
    @total_job_offers = JobOffer.count
    @total_candidatures = Candidature.count
    @interviews = Interview.all
  end
end
