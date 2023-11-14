require './person.rb'

class Student <  Person
    def initialize(@classrom)
        @classrom = @classrom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end