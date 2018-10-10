class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5, maximun: 50 }
  validates :description, presence: true, length: { minimum: 10, maximun: 50 }

end
