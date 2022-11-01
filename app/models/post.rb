class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :clickbait


    def clickbait

        if title == nil
            return 
        end

    clickbait_words = [
        "Won't Believe",
        "Secret",
        "Top [number]",
        "Guess"
    ]
        if clickbait_words.none? {|c| title.include?(c) }
            errors.add(:title, "Not clickbait-y enough!")
        end
    end
end
