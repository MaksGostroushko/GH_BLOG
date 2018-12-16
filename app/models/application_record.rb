class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # Returns whether this class is an abstract class or not.

  def user_like(user)
   likes.find_by(user: user)
 end
end
