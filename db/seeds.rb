# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all records..."
User.destroy_all
Company.destroy_all
JobOffer.destroy_all
Candidature.destroy_all
Interview.destroy_all
TimeSlot.destroy_all

puts "Creating user test"
userRecruiter = User.create!(first_name: "Dylan", last_name: "C", email: "test@gmail.com", password: "1234567", address: "24 chemin des champs gottreux", phone: "123456", user_type: "recruiter", admin: false)
userCandidate = User.create(first_name: "Hadrien", last_name: "C", email: "test1@gmail.com", password: "1234567", address: "24 chemin des champs gottreux", phone: "123456", user_type: "candidate", admin: false)

puts "creating company test"
companyTest = Company.create(name: "EasyRecruit", description: "abcdefabcdefabcdef", email: "test@test.com", address: "Genève", phone: "1234567", industry: "IT", user: userRecruiter)
puts "creating job offer test"
jobOffer = JobOffer.create(title: "fullstack dev", description: "abcdefabcdefabcdef", industry: "IT", address: "Genève", skills: "Ruby on rails", requirements: "Master", contract_type: "Full-time", start_date: Date.today, end_date: Date.tomorrow, company: companyTest)
puts "creating candidature test"
candidatureTest = Candidature.create(user: userCandidate, job_offer: jobOffer, status: "submitted")
puts "timeslot test"
puts candidatureTest.errors.full_messages
timeSlotTest = TimeSlot.create(date: Date.tomorrow, time: Time.now, candidature: candidatureTest, status: "Accepted")
puts "interview test"
puts timeSlotTest.errors.full_messages
interviewTest = Interview.create(time_slot: timeSlotTest, status: "Upcoming", user: userRecruiter)
puts "finished seeding"
puts interviewTest.errors.full_messages
