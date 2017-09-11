class HomeController < ApplicationController
  
  def index
    @employees = Employee.all
    employee_people = Employee.all
    employee_people.each {|v| puts v.ename}
    
  end
end
