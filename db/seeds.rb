 require "open-uri"
 require 'fileutils'

puts "Destroying all records..."

User.destroy_all
Company.destroy_all
JobOffer.destroy_all
Candidature.destroy_all
Interview.destroy_all
Feedback.destroy_all
TimeSlot.destroy_all

puts "Creating user test"
# Créer l'utilisateur recruteur
user_recruiter = User.create(  first_name: "Dylan", last_name: "C", email: "test@gmail.com", password: "1234567", address: "24 chemin des champs gottreux", phone: "123456", user_type: "recruiter", admin: false)

# Créer les utilisateurs candidats
user_candidate1 = User.create(  first_name: "John", last_name: "Doe", email: "john.doe1@example.com", password: "motdepasse1", address: "123 Rue de la République, Paris", phone: "+33 1 23 45 67 89", user_type: "candidate", admin: false)
user_candidate2 = User.create(first_name: "Alice", last_name: "Smith", email: "alice.smith2@example.com", password: "motdepasse2", address: "456 Elm Street, New York", phone: "+1 555-555-5555", user_type: "candidate", admin: false)
user_candidate3 = User.create(first_name: "Bob", last_name: "Johnson", email: "bob.johnson3@example.com", password: "motdepasse3", address: "789 Oak Avenue, Los Angeles", phone: "+1 555-123-4567", user_type: "candidate", admin: false)
user_candidate4 = User.create(first_name: "Emily", last_name: "Brown", email: "emily.brown4@example.com", password: "motdepasse4", address: "1010 Maple Road, Chicago", phone: "+1 555-987-6543", user_type: "candidate", admin: false)
user_candidate5 = User.create(first_name: "David", last_name: "Lee", email: "david.lee5@example.com", password: "motdepasse5", address: "222 Pine Street, San Francisco", phone: "+1 555-222-3333", user_type: "candidate", admin: false)
user_candidate6 = User.create(first_name: "Sophia", last_name: "Wilson", email: "sophia.wilson6@example.com", password: "motdepasse6", address: "333 Cedar Lane, Boston", phone: "+1 555-333-4444", user_type: "candidate", admin: false)
user_candidate7 = User.create(first_name: "Daniel", last_name: "Anderson", email: "daniel.anderson7@example.com", password: "motdepasse7", address: "444 Birch Avenue, Seattle", phone: "+1 555-444-5555", user_type: "candidate", admin: false)
user_candidate8 = User.create(first_name: "Olivia", last_name: "Miller", email: "olivia.miller8@example.com", password: "motdepasse8", address: "555 Spruce Drive, Miami", phone: "+1 555-555-6789", user_type: "candidate", admin: false)
user_candidate9 = User.create(first_name: "William", last_name: "Taylor", email: "william.taylor9@example.com", password: "motdepasse9", address: "666 Oak Street, Atlanta", phone: "+1 555-666-7777", user_type: "candidate", admin: false)
user_candidate10 = User.create(first_name: "Ava", last_name: "Moore", email: "ava.moore10@example.com", password: "motdepasse10", address: "777 Elm Avenue, Dallas", phone: "+1 555-777-8888", user_type: "candidate", admin: false)

# Ajout des avatars aux candidats
user_candidate1.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521443/development/fwrcfykxn1btoy0kdvwty8l7lpx.jpg"), filename: "john_doe.jpg")
user_candidate2.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521442/development/woman-3289372_1280_flp2hw.jpg"), filename: "alice_smith.jpg")
user_candidate3.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521440/development/model-2911329_1280_srlxc9.jpg"), filename: "david_lee.jpg")
user_candidate4.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521441/development/portrait-2865605_1280_pn1ivz.jpg"), filename: "emily_brown.jpg")
user_candidate5.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521442/development/portrait-3157821_1280_zkgw1l.jpg"), filename: "bob_johnson.jpg")
user_candidate6.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521441/development/portrait-2159177_1280_w39ttk.jpg"), filename: "sophia_wilson.jpg")
user_candidate7.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521440/development/black-man-3532185_1280_sdn9up.jpg"), filename: "daniel_anderson.jpg")
user_candidate8.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521440/development/girl-6093779_1280_obxsel.jpg"), filename: "olivia_miller.jpg")
user_candidate9.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521439/development/beard-1845166_1280_v1tsfr.jpg"), filename: "william_taylor.jpg")
user_candidate10.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694521439/development/attractive-1869761_1280_ntu5wb.jpg"), filename: "ava_moore.jpg")

# Créer les compagnies
puts "creating company test"
company_test = Company.create(name: "EasyRecruit", description: "La solution de recrutement", email: "test@test.com", address: "Genève", phone: "1234567", industry: "IT", user: user_recruiter)

# Ajout des logos aux compagnies
company_test.logo.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694524736/development/logo_v2_skgknx.png"), filename: "logo.png", content_type: "image/png")

# Créer des offre lié par companies
puts "creating job offer test"
job_offer_test1 = JobOffer.create(title: "fullstack dev", description: "Job en or !", address: "Genève", skills: "Ruby on rails", requirements: "Master", contract_type: "CDI", start_date: Date.today, end_date: Date.tomorrow, company: company_test, salaire: "25000")
job_offer_test2 = JobOffer.create(title: "Chef de projet", description: "Job en or !", address: "Genève", skills: "Ruby on rails", requirements: "Master", contract_type: "CDD", start_date: Date.today, end_date: Date.tomorrow, company: company_test, salaire: "30000")
job_offer_test3 = JobOffer.create(title: "Full front-end", description: "Job en or !", address: "Genève", skills: "Ruby on rails", requirements: "Master", contract_type: "Intérim", start_date: Date.today, end_date: Date.tomorrow, company: company_test, salaire: "45000")
puts "creating candidature test"

# Créer les candidatures (sans les PJ)
candidature_test1 = Candidature.create(user: user_candidate1, job_offer: job_offer_test1, status: "rejected")
candidature_test2 = Candidature.create(user: user_candidate2, job_offer: job_offer_test1, status: "accepted")
candidature_test3 = Candidature.create(user: user_candidate3, job_offer: job_offer_test1, status: "submitted")
candidature_test4 = Candidature.create(user: user_candidate4, job_offer: job_offer_test2, status: "accepted")
candidature_test5 = Candidature.create(user: user_candidate5, job_offer: job_offer_test2, status: "rejected")
candidature_test6 = Candidature.create(user: user_candidate6, job_offer: job_offer_test2, status: "submitted")
candidature_test7 = Candidature.create(user: user_candidate7, job_offer: job_offer_test3, status: "accepted")
candidature_test8 = Candidature.create(user: user_candidate8, job_offer: job_offer_test3, status: "submitted")
candidature_test9 = Candidature.create(user: user_candidate9, job_offer: job_offer_test3, status: "submitted")
candidature_test10 = Candidature.create(user: user_candidate10, job_offer: job_offer_test3, status: "accepted")

# Ajout des PJ aux candidatures
candidature_test1.cv.attach(io: File.open("app/assets/pdf_files/cv1.pdf"), filename: "cv1.pdf")
candidature_test1.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation1.pdf"), filename: "lettre_motivation1.pdf")
candidature_test2.cv.attach(io: File.open("app/assets/pdf_files/cv2.pdf"), filename: "cv2.pdf")
candidature_test2.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation2.pdf"), filename: "lettre_motivation2.pdf")
candidature_test3.cv.attach(io: File.open("app/assets/pdf_files/cv3.pdf"), filename: "cv3.pdf")
candidature_test3.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation3.pdf"), filename: "lettre_motivation3.pdf")
candidature_test4.cv.attach(io: File.open("app/assets/pdf_files/cv4.pdf"), filename: "cv4.pdf")
candidature_test4.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation4.pdf"), filename: "lettre_motivation4.pdf")
candidature_test5.cv.attach(io: File.open("app/assets/pdf_files/cv5.pdf"), filename: "cv5.pdf")
candidature_test5.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation5.pdf"), filename: "lettre_motivation5.pdf")
candidature_test6.cv.attach(io: File.open("app/assets/pdf_files/cv6.pdf"), filename: "cv6.pdf")
candidature_test6.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation6.pdf"), filename: "lettre_motivation6.pdf")
candidature_test7.cv.attach(io: File.open("app/assets/pdf_files/cv7.pdf"), filename: "cv7.pdf")
candidature_test7.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation7.pdf"), filename: "lettre_motivation7.pdf")
candidature_test8.cv.attach(io: File.open("app/assets/pdf_files/cv8.pdf"), filename: "cv8.pdf")
candidature_test8.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation8.pdf"), filename: "lettre_motivation8.pdf")
candidature_test9.cv.attach(io: File.open("app/assets/pdf_files/cv9.pdf"), filename: "cv9.pdf")
candidature_test9.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation9.pdf"), filename: "lettre_motivation9.pdf")
candidature_test10.cv.attach(io: File.open("app/assets/pdf_files/cv10.pdf"), filename: "cv10.pdf")
candidature_test10.lettre_motivation.attach(io: File.open("app/assets/pdf_files/lettre_motivation10.pdf"), filename: "lettre_motivation10.pdf")

puts "timeslot test"
# Créer des timeslots qui sont lié a une candidature
time_slot_test1 = TimeSlot.create(
  date: Date.tomorrow, time: Time.now, candidature: candidature_test2, status: "Pending"
)
time_slot_test2 = TimeSlot.create(
  date: Date.tomorrow, time: Time.now, candidature: candidature_test4, status: "Accepted"
)
# time_slot_test3 = TimeSlot.create(
#   date: Date.tomorrow, time: Time.now, candidature: candidature_test7, status: "Accepted"
# )
time_slot_test4 = TimeSlot.create(
  date: Date.tomorrow, time: Time.now, candidature: candidature_test8, status: "Accepted"
)
time_slot_test5 = TimeSlot.create(
  date: Date.tomorrow, time: Time.now, candidature: candidature_test9, status: "Accepted"
)
time_slot_test6 = TimeSlot.create(
  date: Date.tomorrow, time: Time.now, candidature: candidature_test10, status: "Rejected"
)
puts "interview test"
# Créer des entretiens qui sont lié a un timeslot et a un user recruteur
interview_test1 = Interview.create(
  time_slot: time_slot_test2, status: "Done", user: user_recruiter
)
# interview_test2 = Interview.create(
#   time_slot: time_slot_test3, status: "Upcoming", user: user_recruiter
# )
interview_test3 = Interview.create(
  time_slot: time_slot_test4, status: "Done", user: user_recruiter
)
puts "feedback test"
# Créer des feedbacks qui sont lié a un entretien et a un user candidat
feedback_test1 = Feedback.create(
  score: 4, comment: "Ceci est un super commentaire pour indiquer que c'est un entretien génial", user: user_recruiter, interview: interview_test1
)
feedback_test2 = Feedback.create(
  score: 3, comment: "Ceci est un super commentaire pour indiquer que c'est un entretien génial", user: user_recruiter, interview: interview_test3
)
puts "finished seeding"
# Créer des tests pour les validations avec des messages d'erreurs
puts user_recruiter.errors.full_messages
puts user_candidate1.errors.full_messages
puts user_candidate2.errors.full_messages
puts user_candidate3.errors.full_messages
puts user_candidate4.errors.full_messages
puts user_candidate5.errors.full_messages
puts user_candidate6.errors.full_messages
puts user_candidate7.errors.full_messages
puts user_candidate8.errors.full_messages
puts user_candidate9.errors.full_messages
puts user_candidate10.errors.full_messages
puts company_test.errors.full_messages
puts job_offer_test1.errors.full_messages
puts job_offer_test2.errors.full_messages
puts job_offer_test3.errors.full_messages
puts candidature_test1.errors.full_messages
puts candidature_test2.errors.full_messages
puts candidature_test3.errors.full_messages
puts candidature_test4.errors.full_messages
puts candidature_test5.errors.full_messages
puts candidature_test6.errors.full_messages
puts candidature_test7.errors.full_messages
puts candidature_test8.errors.full_messages
puts candidature_test9.errors.full_messages
puts candidature_test10.errors.full_messages
puts time_slot_test1.errors.full_messages
puts time_slot_test2.errors.full_messages
# puts time_slot_test3.errors.full_messages
puts time_slot_test4.errors.full_messages
puts time_slot_test5.errors.full_messages
puts time_slot_test6.errors.full_messages
puts interview_test1.errors.full_messages
# puts interview_test2.errors.full_messages
puts interview_test3.errors.full_messages
puts feedback_test1.errors.full_messages
puts feedback_test2.errors.full_messages
