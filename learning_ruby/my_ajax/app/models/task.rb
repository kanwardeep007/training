class Task < ApplicationRecord
  def completed?
    self.completed
  end
end
