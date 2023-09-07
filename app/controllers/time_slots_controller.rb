class TimeSlotsController < ApplicationController


  private

  def time_slot_params
    params.require(:time_slot).permit(:date, :time, :status, candidature_ids: [])
  end
end
