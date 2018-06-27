class Request < ApplicationRecord
  has_many :req_infos, dependent: :destroy
end
