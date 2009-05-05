class SoccerPlayer < ActiveRecord::Base

  belongs_to :team

  validates_presence_of :age
  validates_presence_of :level
  validates_presence_of :name

  acts_as_seekable :paginate => true

  #Write all the named scopes you need for the filter paramater.
  #Write a named scope called search with a lambda,
  #this is important for your search field to work

  #By status
  named_scope :active, :conditions => { :active => true }
  named_scope :inactive, :conditions => { :active => false }

  #By level
  named_scope :amateur, :conditions => { :level => 'Amateur' }
  named_scope :semipro, :conditions => { :level => 'Semipro' }
  named_scope :pro, :conditions => { :level => 'Pro' }

  #By age
  named_scope :child, :conditions => { :age => 5..14 }
  named_scope :old, :conditions => { :age => 31..99 }
  named_scope :young, :conditions => { :age => 15..30 }

  named_scope :search, lambda { |value| {
    :conditions => "soccer_players.name LIKE '%#{value}%'" }}

  def description
    "#{name} [#{team_name}]"
  end

  def team_name
    team ? team.name : "No team"
  end



end
