class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # Returns whether this class is an abstract class or not.
end
