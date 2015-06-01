class Lot < ActiveRecord::Base
  belongs_to :device
  has_many :sites
  has_many :data
  has_many :alerts
  #validate the necessary blank
  validates :name, presence: true
  validates :tester, presence: true
  validates :device, presence: true
  validates :total_device_count, presence: true
  validates :site_number, presence: true
  validates :generate_mode, presence: true

  #validate the necessary if the generate mode is NORMAL
  #validates :basic_yield, presence: true, :unless => lambda { self.generate_mode != NORMAL }

  #validates :basic_yield, presence: true, :if => :mode_normal?
  #validates :cliff_number, :first_region_yield, :second_region_yield, presence: true, :if => :mode_cliff?

  def mode_normal?
    generate_mode == 1
  end

  def mode_cliff?
    generate_mode == 2
  end

  def mode_site_difference?
    generate_mode == 3
  end
end
