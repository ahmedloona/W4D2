class Cat < ApplicationRecord
  COLORS = %w(black white pink blue yellow)
  validates :color, presence: true, inclusion: { :in => COLORS }
  validates :birth_date, presence: true
  validates :sex, presence: true, inclusion: { :in => ["M", "F"] }
  validates :name, presence: true

  def age

    age = ((Time.now - (self.birth_date).to_time) / (60*60*24*365)).round
  end

  def self.colors
    COLORS
  end



end
