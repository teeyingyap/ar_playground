# if you have not installed the needed gems, please do the following:
# gem install sqlite3
# gem install activerecord

require "sqlite3"
require "active_record"

# this line configures ActiveRecord to connect to a sqlite3 database in the same folder named "students.sqlite3"
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "./students.sqlite3")

# This sets up ActiveRecord to use Ruby OOP with SQL data
class Student < ActiveRecord::Base
end

####################################
# Write your test code here

# 1. Create a new student using new and save
# student = Student.new(name: "Harry Potter", email: "harry@example.com", age: 18)
# student.save
# p student 
# 2. Create a new student using create
# student = Student.create(name: "Luke Watt", email: "luke@example.com", age: 23)
# p student 
# 3. Select all students
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.all 
#Student.all returns an array filled with student objects 

# Why can't you do Student.name or Student.email?
#because Student is an array 

students = Student.count #notice the plural
p students # did you get 22?

p students[5] # did you get the student information with id 4? Also, what object was returned to you?

# 4. Select the first student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.first ##<ActiveRecord::Relation object

# 5. Select the last student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.last ##<ActiveRecord::Relation object


# 6. Use each to iterate through the #<ActiveRecord::Relation> object to display the name of each student
Student.all.each do |student|
    p student.name
end


# 7. Find student by the name Dr. Lois Pfeff using where.
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
student = Student.where(name: "Dr. Lois Pfeff")
p student ##<ActiveRecord::Relation object
# this return an array so the following wont work.

# What will the following return to you? (remember to comment out the code!)
# p student.id
# p student.name
# p student.email
# p student.age


# 8. Find student by name using find_by
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
student = Student.find_by(name: "Dr. Lois Pfeff")
p student
# find_by returns Student object
# What will the following return to you?
p student.id
p student.name
p student.email
p student.age

# Do research on the difference between "where" and "find_by".
# find => this is used to find row by id.
#  This will return single record.

 
# Apart from accepted answer, following is also valid

# Model.find() can accept array of ids, and will return all records which matches. 
#Model.find_by_id(123) also accept array but will only process first id value present in array

# Model.find([1,2,3])
# Model.find_by_id([1,2,3]) #=> only return record of id 1 

#where returns an Array of activerecord object


# 9. Find the student with id = 7 using find and find_by
# pay attention to the object that is returned to you, is it the User object or Active Record relation object?
p Student.find(7)
p Student.find_by(id: 7)
# find_by returns Student object


# 10. Update information for student with id = 5 using student.email and save. Change the student's email to elsie@example.com
student = Student.find(5)
p student
student.email = "elsie@example.com"
student.save
p student # check that the email has indeed been updated.


# 11. Now use update to update this student's age to 21.
student.update(age: 21)
p student


# 12. Delete student with id 21 using delete
# student = Student.find(21)
# student.destroy
# p Student.all.count # there should be 21 students left in the database


# 13. Delete student with id 22 using destroy
# student = Student.find(22)
# student.destroy
# p Student.all.count 

ab = Student.all[3]
p ab 