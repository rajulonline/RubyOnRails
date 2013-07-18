class Login < ActiveRecord::Base

  attr_accessible :user, :password, :email
  validates :user,
            :uniqueness => true,
            :allow_blank => false
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[\w\d]+/ , :message => "is invalid"
# before_validation :ensure_user_has_a_value
# def ensure_user_has_a_value
# if user.blank?
# self.user = email unless email.blank?
# end
# end

end