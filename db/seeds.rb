
User.delete_all
Course.delete_all
Enroll.delete_all
Announcement.delete_all
Question.delete_all
Answer.delete_all

user_data = JSON.parse(open('db/data/users.json').read) 
course_data = JSON.parse(open('db/data/courses.json').read) 
enroll_data = JSON.parse(open('db/data/enrolls.json').read) 
announce_data = JSON.parse(open('db/data/announcements.json').read) 
question_data = JSON.parse(open('db/data/questions.json').read) 
answer_data = JSON.parse(open('db/data/answers.json').read) 

user_data.each do |user_hash| 
  user = User.new
  user.name   = user_hash['name']
  user.email  = user_hash['email'] 
  user.dept   = user_hash['dept']
  user.role   = user_hash['role']
  user.save
end

course_data.each do |course_hash| 
  course = Course.new
  course.code         = course_hash['code']
  course.title        = course_hash['title'] 
  course.year         = course_hash['year']
  course.quater       = course_hash['quater']
  course.description  = course_hash['description']
  course.save
end

enroll_data.each do |enroll_hash| 
  enroll = Enroll.new 
  enroll.course_id  = enroll_hash['course_id']
  enroll.user_id    = enroll_hash['user_id']
  enroll.save
end

announce_data.each do |announce_hash| 
  announce = Announcement.new 
  announce.title      = announce_hash['title']
  announce.content    = announce_hash['content']
  announce.date       = announce_hash['date']
  announce.course_id  = announce_hash['course_id']
  announce.save
end

question_data.each do |question_hash| 
  question = Question.new 
  question.title      = question_hash['title']
  question.content    = question_hash['content']
  question.date       = question_hash['date']
  question.course_id  = question_hash['course_id']
  question.user_id    = question_hash['user_id']
  question.save
end

answer_data.each do |answer_hash| 
  answer = Answer.new 
  answer.content      = answer_hash['content']
  answer.date         = answer_hash['date']
  answer.question_id  = answer_hash['question_id']
  answer.user_id      = answer_hash['user_id']
  answer.save
end

