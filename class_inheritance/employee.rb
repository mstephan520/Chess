class Employee
    attr_reader :salary
    def initialize(name, position, salary)
        @name = name
        @position = position
        @salary = salary
    end

    def bonus(multiplier)
        return self.salary * multiplier
    end
end