require_relative '../../db/config'

class Student < ActiveRecord::Base

  validates :email, format: {with: /\w+\S*@\w+[\.]\w{2,}/i, message: "must contain @ and ."} 
  validates :email, uniqueness: true #another way to validate email: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :age, numericality: {greater_than: 4}
  #Phone numbers must contain at least 10 digits, excluding non-numeric characters.
  validates :phone, length: { minimum: 10}

  def name
    "#{first_name} #{last_name}"
  end
                                                    # From Rspec:birthday => Date.new(1970,9,1)
  def age
    ((Time.now - birthday.to_time).to_i / 31557600)   #Time.now.to_i => 1377193854  and 1970-01-01.to_i=>1968  
                                                     # therefore substracting them equals =>1377191886(sec)
                                                      #Passing to a years: 1 Second = 3.16887385068114E-08
                                                      #therefore diving by 31557600 equals => 43.64
  end
end

