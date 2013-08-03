class EmailNotifications < ActionMailer::Base

  default from: "lakshmi@epoch.com"
  
  def welcome_email()
    
    
    mail(to: "rajulonline@gmail.com", subject: 'Welcome to My Awesome Site')
  end
  
end