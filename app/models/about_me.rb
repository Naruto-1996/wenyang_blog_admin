class AboutMe < ApplicationRecord
    validates :birthday, :graduated_from, :website, :hobby, :address, :title, :description, presence: true
end
