class Person < ApplicationRecord

    validates :age, numbericality: {
    less_than_or_equal_to: 150,
    greater_than_or_equal_to: 18,
    }

    validates :alive, inclusion: {
        in %w (true, false),
        message: "%{value} is invalid"
    }

    validates :gender, :name, :age, :alive, presence: true

    validates :hair_color, :eye_color, allow_blank: true

    validates :name, uniqueness: true

    #methods

    # class method
    # Call back

    def self.order_age
        order(:age)
    end


    # instance method
    before_create :set_alive

    def  set_alive
        self.alive = true
    end

end
