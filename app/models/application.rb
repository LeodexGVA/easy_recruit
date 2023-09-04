class Application < ApplicationRecord
  belongs_to :job_offer
  belongs_to :user
end
