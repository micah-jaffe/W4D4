class Band < ApplicationRecord
  validates :name, presence: true
  
  def to_s
    self.class.name.to_s
  end
end
