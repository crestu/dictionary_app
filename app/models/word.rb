class Word < ApplicationRecord

    # belongs_to :list

    has_many :list_words
    has_many :lists, through: :list_words

    validates :word, presence: true
    validates :definition, presence: true
end
