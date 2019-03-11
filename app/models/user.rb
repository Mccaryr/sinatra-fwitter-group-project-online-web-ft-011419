class User < ActiveRecord::Base
    has_secure_password
    has_many :tweets
    def slugify(string)
      string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
end
