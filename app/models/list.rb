class List < ApplicationRecord
    
    belongs_to :user

    has_many :list_words
    has_many :words, through: :list_words

    validates :list, presence: true
    validates :list_name, presence: true

end
