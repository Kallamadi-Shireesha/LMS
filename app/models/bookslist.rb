class Bookslist < ActiveRecord::Base
    belongs_to :users
    has_many :requests
    has_many :requestedbooks
    
end
