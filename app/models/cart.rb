class Cart < ApplicationRecord
    has_many :items,dependent: :destroy
    validates :title, presence: true,exclusion: { in: [nil],message: "Title cannot Be nil" }
    validates :total, presence: true
    after_initialize :default_values
    def default_values
        self.total = 0 if self.new_record?
    end
end
