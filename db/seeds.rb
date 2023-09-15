 require "open-uri"

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
user_recruiter1 = User.create(  first_name: "Dylan", last_name: "C", email: "test@gmail.com", password: "1234567", address: "24 chemin des champs gottreux", phone: "123456", user_type: "recruiter", admin: false)
user_recruiter2 = User.create(  first_name: "Michel", last_name: "F", email: "test2@gmail.com", password: "1234567", address: "Lyon", phone: "123456", user_type: "recruiter", admin: false)
user_recruiter3 = User.create(  first_name: "Hadrien", last_name: "G", email: "test3@gmail.com", password: "1234567", address: "Paris", phone: "123456", user_type: "recruiter", admin: false)

# Créer les utilisateurs candidats
user_candidate1 = User.create(  first_name: "John", last_name: "Doe", email: "john.doe1@example.com", password: "motdepasse1", address: "123 Rue de la République, Paris", phone: "+33 1 23 45 67 89", user_type: "candidate", admin: false, birth_date: Date.parse("1998-01-15"), linkedin_url: "https://www.linkedin.com/in/john-doe-58642923b")
user_candidate2 = User.create(first_name: "Alice", last_name: "Smith", email: "alice.smith2@example.com", password: "motdepasse2", address: "456 Elm Street, New York", phone: "+1 555-555-5555", user_type: "candidate", admin: false, birth_date: Date.parse("1999-03-23"), linkedin_url: "https://www.linkedin.com/in/alicesmit")
user_candidate3 = User.create(first_name: "Bob", last_name: "Johnson", email: "bob.johnson3@example.com", password: "motdepasse3", address: "789 Oak Avenue, Los Angeles", phone: "+1 555-123-4567", user_type: "candidate", admin: false, birth_date: Date.parse("1996-11-09"), linkedin_url: "https://www.linkedin.com/in/bobljohnson")
user_candidate4 = User.create(first_name: "Emily", last_name: "Brown", email: "emily.brown4@example.com", password: "motdepasse4", address: "1010 Maple Road, Chicago", phone: "+1 555-987-6543", user_type: "candidate", admin: false, birth_date: Date.parse("1997-07-01"), linkedin_url: "https://www.linkedin.com/in/emily-brown-25651533")
user_candidate5 = User.create(first_name: "David", last_name: "Lee", email: "david.lee5@example.com", password: "motdepasse5", address: "222 Pine Street, San Francisco", phone: "+1 555-222-3333", user_type: "candidate", admin: false, birth_date: Date.parse("1997-02-25"), linkedin_url: "https://www.linkedin.com/in/davidhyungteklee")
user_candidate6 = User.create(first_name: "Sophia", last_name: "Wilson", email: "sophia.wilson6@example.com", password: "motdepasse6", address: "333 Cedar Lane, Boston", phone: "+1 555-333-4444", user_type: "candidate", admin: false, birth_date: Date.parse("1994-04-18"), linkedin_url: "https://www.linkedin.com/in/sophia-wilson-5481b110a")
user_candidate7 = User.create(first_name: "Daniel", last_name: "Anderson", email: "daniel.anderson7@example.com", password: "motdepasse7", address: "444 Birch Avenue, Seattle", phone: "+1 555-444-5555", user_type: "candidate", admin: false, birth_date: Date.parse("1995-10-11"), linkedin_url: "https://www.linkedin.com/in/daniel-anderson-a732a28")
user_candidate8 = User.create(first_name: "Olivia", last_name: "Miller", email: "olivia.miller8@example.com", password: "motdepasse8", address: "555 Spruce Drive, Miami", phone: "+1 555-555-6789", user_type: "candidate", admin: false, birth_date: Date.parse("2000-03-02"), linkedin_url: "https://www.linkedin.com/in/olivia-miller-61b7a3267")
user_candidate9 = User.create(first_name: "William", last_name: "Taylor", email: "william.taylor9@example.com", password: "motdepasse9", address: "666 Oak Street, Atlanta", phone: "+1 555-666-7777", user_type: "candidate", admin: false, birth_date: Date.parse("1994-08-07"), linkedin_url: "https://www.linkedin.com/in/william-taylor-098648163")
user_candidate10 = User.create(first_name: "Ava", last_name: "Moore", email: "ava.moore10@example.com", password: "motdepasse10", address: "777 Elm Avenue, Dallas", phone: "+1 555-777-8888", user_type: "candidate", admin: false, birth_date: Date.parse("1995-05-21"), linkedin_url: "https://www.linkedin.com/in/ava-moore-48aab237")

# Ajout des avatars aux candidats
user_candidate1.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676370/avatars/young-man-1281282_1280_tlu7n8.jpg"), filename: "john_doe.jpg")
user_candidate2.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676369/avatars/portrait-2159177_1280_ywhuav.jpg"), filename: "alice_smith.jpg")
user_candidate3.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676367/avatars/model-2911329_1280_os3zht.jpg"), filename: "david_lee.jpg")
user_candidate4.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676368/avatars/girl-6093779_1280_qvzd1f.jpg"), filename: "emily_brown.jpg")
user_candidate5.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676366/avatars/black-man-3532185_1280_rpqup7.jpg"), filename: "bob_johnson.jpg")
user_candidate6.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676368/avatars/woman-3289372_1280_lgd4lm.jpg"), filename: "sophia_wilson.jpg")
user_candidate7.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676367/avatars/beard-1845166_1280_k7xwx2.jpg"), filename: "daniel_anderson.jpg")
user_candidate8.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676365/avatars/attractive-1869761_1280_ejuu5c.jpg"), filename: "olivia_miller.jpg")
user_candidate9.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676366/avatars/portrait-3157821_1280_mz0mfb.jpg"), filename: "william_taylor.jpg")
user_candidate10.avatar.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676365/avatars/portrait-2865605_1280_ne5vdo.jpg"), filename: "ava_moore.jpg")

# Créer les compagnies
puts "creating company test"
company_test1 = Company.create(name: "Le Wagon", description: "Formez-vous aux métiers de la Tech", email: "contact@lewagon.com", address: "16 Villa Gaudelet, 75011 Paris", phone: "+33 1 23 45 67 89", industry: "IT", user: user_recruiter2)
company_test2 = Company.create(name: "Publicis Media", description: "Publicis Media exploite la puissance des médias modernes grâce à des marques d'agence mondiales", email: "contact@publicis.com", address: "43 rue Paradis, 13002 Marseille", phone: "+33 1 23 45 67 89", industry: "Marketing", user: user_recruiter1)
company_test3 = Company.create(name: "Qonto", description: "Toutes vos finances pro. Une seule solution", email: "contact@qonto.com", address: "9 rue de Navarin, 75009 Paris", phone: "+33 1 23 45 67 89", industry: "Finance", user: user_recruiter3)
# Ajout des logos aux compagnies
company_test1.logo.attach(io: File.open(Rails.root.join("app/assets/images/logo_wagon.png")), filename: "logo1.png", content_type: "image/png")
company_test2.logo.attach(io: URI.open("https://www.publicisgroupe.com/themes/custom/publicis/front/src/images/theme/share.jpg"), filename: "logo2.png", content_type: "image/png")
company_test3.logo.attach(io: URI.open("https://pbs.twimg.com/profile_images/1493510639054200834/iuwQUAyN_400x400.jpg"), filename: "logo2.png", content_type: "image/png")

# Créer des offre lié par companies
puts "creating job offer test"

# Adresses possibles
addresses = [
  "Carrer del Bruc 149, 08037 Barcelona",
  "16 Villa Gaudelet, 75011 Paris",
  "20 rue des Capucins, 69001 Lyon",
  "IJsbaanpad 9, 1076 CV Amsterdam",
  "Rudi-Dutschke-Straße 26, 10969 Berlin",
  "Cantersteen Street 10, 1000 Brussels",
  "9 rue de Navarin, 75009 Paris",
  "43 rue Paradis, 13002 Marseille"
]

# Offre d'emploi 1
job_offer_test1 = JobOffer.create(
  title: "Développeur Full Stack Ruby on Rails",
  description: "Rejoignez notre équipe de développement et contribuez à la création de solutions web innovantes.",
  address: addresses.sample, # Adresse aléatoire
  skills: "Ruby on Rails, HTML, CSS, JavaScript",
  requirements: "Baccalauréat en informatique",
  contract_type: "CDI",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days, # Date aléatoire entre 30 et 90 jours à partir d'aujourd'hui
  deadline: Date.today + rand(0..30).days, # Date limite aléatoire entre la start_date et end_date
  company: company_test1,
  salaire: "25000"
)

# Offre d'emploi 2
job_offer_test2 = JobOffer.create(
  title: "Chef de Projet Technique",
  description: "Gérez des projets passionnants, travaillez avec une équipe talentueuse et contribuez au succès de nos clients.",
  address: addresses.sample, # Adresse aléatoire
  skills: "Gestion de projet, Communication, Leadership",
  requirements: "Master en gestion de projet",
  contract_type: "CDD",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days, # Date aléatoire entre 30 et 90 jours à partir d'aujourd'hui
  deadline: Date.today + rand(0..30).days, # Date limite aléatoire entre la start_date et end_date
  company: company_test1,
  salaire: "30000"
)

# Offre d'emploi 3
job_offer_test3 = JobOffer.create(
  title: "Développeur Front-end JavaScript",
  description: "Créez des interfaces utilisateur exceptionnelles, collaborez avec des designers et améliorez l'expérience utilisateur.",
  address: addresses.sample, # Adresse aléatoire
  skills: "JavaScript, React, HTML, CSS",
  requirements: "Baccalauréat en informatique",
  contract_type: "Intérim",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days, # Date aléatoire entre 30 et 90 jours à partir d'aujourd'hui
  deadline: Date.today + rand(0..30).days, # Date limite aléatoire entre la start_date et end_date
  company: company_test1,
  salaire: "45000"
)

# Offre d'emploi 4
job_offer_test4 = JobOffer.create(
  title: "Ingénieur DevOps",
  description: "Gérez nos pipelines CI/CD, assurez la disponibilité de nos services cloud et automatisez nos déploiements.",
  address: addresses.sample,
  skills: "DevOps, Docker, Kubernetes",
  requirements: "Baccalauréat en informatique",
  contract_type: "CDI",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days,
  deadline: Date.today + rand(0..30).days,
  company: company_test1,
  salaire: "55000"
)

# Offre d'emploi 5
job_offer_test5 = JobOffer.create(
  title: "Ingénieur en Sécurité Informatique",
  description: "Protégez nos systèmes contre les menaces en ligne, effectuez des audits de sécurité et développez des politiques de sécurité.",
  address: addresses.sample,
  skills: "Sécurité informatique, Cryptographie",
  requirements: "Master en sécurité informatique",
  contract_type: "CDI",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days,
  deadline: Date.today + rand(0..30).days,
  company: company_test1,
  salaire: "60000"
)

# Offre d'emploi 6
job_offer_test6 = JobOffer.create(
  title: "Data Scientist",
  description: "Analysez des données massives, développez des modèles prédictifs et aidez à prendre des décisions basées sur les données.",
  address: addresses.sample,
  skills: "Science des données, Python, Machine Learning",
  requirements: "Master en science des données",
  contract_type: "CDD",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days,
  deadline: Date.today + rand(0..30).days,
  company: company_test1,
  salaire: "58000"
)

# Offre d'emploi 7
job_offer_test7 = JobOffer.create(
  title: "Développeur Mobile (iOS/Android)",
  description: "Créez des applications mobiles de qualité, collaborez avec des designers UX/UI et assurez-vous de leur performance.",
  address: addresses.sample,
  skills: "Développement mobile, iOS, Android",
  requirements: "Baccalauréat en informatique",
  contract_type: "CDI",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days,
  deadline: Date.today + rand(0..30).days,
  company: company_test1,
  salaire: "54000"
)

# Offre d'emploi 8
job_offer_test8 = JobOffer.create(
  title: "Architecte Cloud",
  description: "Concevez des infrastructures cloud évolutives, optimisez les coûts et assurez la disponibilité des services.",
  address: addresses.sample,
  skills: "Architecture cloud, AWS, Azure",
  requirements: "Master en informatique",
  contract_type: "Intérim",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days,
  deadline: Date.today + rand(0..30).days,
  company: company_test1,
  salaire: "62000"
)

# Offre d'emploi 9
job_offer_test9 = JobOffer.create(
  title: "Ingénieur DevOps",
  description: "Gérez nos pipelines CI/CD, assurez la disponibilité de nos services cloud et automatisez nos déploiements.",
  address: addresses.sample,
  skills: "DevOps, Docker, Kubernetes",
  requirements: "Baccalauréat en informatique",
  contract_type: "CDI",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days,
  deadline: Date.today + rand(0..30).days,
  company: company_test1,
  salaire: "55000"
)

# Offre d'emploi 10
job_offer_test10 = JobOffer.create(
  title: "Développeur Front-end",
  description: "Concevez et développez des interfaces utilisateur attrayantes, travaillez en étroite collaboration avec des designers.",
  address: addresses.sample,
  skills: "Développement Front-end, HTML, CSS, JavaScript",
  requirements: "Baccalauréat en informatique",
  contract_type: "CDD",
  start_date: Date.today,
  end_date: Date.today + rand(30..90).days,
  deadline: Date.today + rand(0..30).days,
  company: company_test1,
  salaire: "52000"
)

# Créer les candidatures (sans les PJ)
puts "creating candidature test"
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
candidature_test1.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676542/PDF/cv1_gy7wiy.pdf"), filename: "cv1.pdf")
candidature_test1.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676535/PDF/lettre_motivation1_altize.pdf"), filename: "lettre_motivation1.pdf")
candidature_test2.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676541/PDF/cv2_aphrqw.pdf"), filename: "cv2.pdf")
candidature_test2.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676534/PDF/lettre_motivation2_m0x6o1.pdf"), filename: "lettre_motivation2.pdf")
candidature_test3.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676540/PDF/cv3_myw5kx.pdf"), filename: "cv3.pdf")
candidature_test3.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676533/PDF/lettre_motivation3_eylwxj.pdf"), filename: "lettre_motivation3.pdf")
candidature_test4.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676539/PDF/cv4_nfwcl4.pdf"), filename: "cv4.pdf")
candidature_test4.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676531/PDF/lettre_motivation4_aiut0f.pdf"), filename: "lettre_motivation4.pdf")
candidature_test5.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676539/PDF/cv5_ngp6k9.pdf"), filename: "cv5.pdf")
candidature_test5.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676532/PDF/lettre_motivation5_m6tpjg.pdf"), filename: "lettre_motivation5.pdf")
candidature_test6.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676538/PDF/cv6_lcot5m.pdf"), filename: "cv6.pdf")
candidature_test6.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676530/PDF/lettre_motivation6_m5ziv6.pdf"), filename: "lettre_motivation6.pdf")
candidature_test7.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676537/PDF/cv7_ifco50.pdf"), filename: "cv7.pdf")
candidature_test7.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676530/PDF/lettre_motivation7_nyc4qq.pdf"), filename: "lettre_motivation7.pdf")
candidature_test8.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676536/PDF/cv8_hmyb7j.pdf"), filename: "cv8.pdf")
candidature_test8.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676529/PDF/lettre_motivation8_gekcyh.pdf"), filename: "lettre_motivation8.pdf")
candidature_test9.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676535/PDF/cv9_jxhyeo.pdf"), filename: "cv9.pdf")
candidature_test9.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676529/PDF/lettre_motivation9_kgyvhg.pdf"), filename: "lettre_motivation9.pdf")
candidature_test10.cv.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676542/PDF/cv10_x5vp7i.pdf"), filename: "cv10.pdf")
candidature_test10.lettre_motivation.attach(io: URI.open("https://res.cloudinary.com/dlvve11nm/image/upload/v1694676533/PDF/lettre_motivation10_skdr9v.pdf"), filename: "lettre_motivation10.pdf")

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
  time_slot: time_slot_test2, status: "Done", user: user_recruiter1
)
# interview_test2 = Interview.create(
#   time_slot: time_slot_test3, status: "Upcoming", user: user_recruiter
# )
interview_test3 = Interview.create(
  time_slot: time_slot_test4, status: "Done", user: user_recruiter1
)
puts "feedback test"
# Créer des feedbacks qui sont lié a un entretien et a un user candidat
feedback_test1 = Feedback.create(
  score: 4, comment: "Ceci est un super commentaire pour indiquer que c'est un entretien génial", user: user_recruiter1, interview: interview_test1
)
feedback_test2 = Feedback.create(
  score: 3, comment: "Ceci est un super commentaire pour indiquer que c'est un entretien génial", user: user_recruiter1, interview: interview_test3
)
puts "finished seeding"
# Créer des tests pour les validations avec des messages d'erreurs
puts user_recruiter1.errors.full_messages
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
puts company_test1.errors.full_messages
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
