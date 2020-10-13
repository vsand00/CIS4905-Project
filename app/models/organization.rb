class Organization < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :events, dependent: :destroy
    validates :title, presence: true,
                      length: { minimum: 5 }
    validates :title, uniqueness: true                  
    validate :is_valid_url?

    def is_valid_url?
        uri = URI.parse(url)
       unless uri.is_a?(URI::HTTP) && !uri.host.nil? && %w( http https ).include?(uri.scheme)
            errors.add(:url, "Must be valid URL")
       end
    rescue URI::BadURIError
        errors.add(:url, "Must be valid URL")
        false
    rescue URI::InvalidURIError
        errors.add(:url, "Must be valid URL")
        false
    end
end