class User < ActiveRecord::Base
    has_many :bookslists
    has_many :requests
    def is_owner?
        role == "owner"
      end
end
