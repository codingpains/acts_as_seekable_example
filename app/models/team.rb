class Team < ActiveRecord::Base

  has_many :soccer_players

  validates_presence_of :name
  validates_presence_of :championships

  before_destroy :kick_out_players

  accepts_nested_attributes_for :soccer_players, :allow_destroy => true

  acts_as_seekable # Example with no pagination

  #By Championships
  named_scope :noob, :conditions => {:championships => 0..2}
  named_scope :ruler, :conditions => {:championships => 3..20}

  #By level
  named_scope :amateur, :conditions => { :level => 'Amateur' }
  named_scope :semipro, :conditions => { :level => 'Semipro' }
  named_scope :pro, :conditions => { :level => 'Pro' }

  named_scope :search, lambda {|value|{ :conditions =>
    "teams.name LIKE '%#{value}%' OR teams.city LIKE '%#{value}%'"}}


  private
  def kick_out_players
    soccer_players.each { |player|
      player.team = nil
      player.save(false)
    }
  end

end
