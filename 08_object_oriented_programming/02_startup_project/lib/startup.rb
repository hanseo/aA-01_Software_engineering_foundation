require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.has_key?(title)
  end

  def >(another_startup)
    funding > another_startup.funding
  end

  def hire(employee_name, title)
    raise "there was an error" if !valid_title?(title)
    
    employees << Employee.new(employee_name, title)
  end

  def size
    employees.size
  end

  def pay_employee(employee)
    amount = salaries[employee.title]

    raise "not enough funding" if funding < amount
    
    employee.pay(amount)
    @funding -= amount
  end

  def payday
    employees.each { |employee| pay_employee(employee) } 
  end

  def average_salary
    all_salaries = []
    employees.each do |employee|
      all_salaries << salaries[employee.title]
    end

    all_salaries.sum / size
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(another_startup)
    @funding += another_startup.funding

    another_startup.salaries.each do |title, amount|
      if !valid_title?(title)
        salaries[title] = amount
      end
    end

    @employees += another_startup.employees

    another_startup.close
  end
end
