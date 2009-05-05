module SoccerPlayersHelper

  def soccer_player_status(active)
    if active
      content_tag(:span, "Active", :class => 'active')
    else
      content_tag(:span, "Retired", :class => 'inactive')
    end
  end

  def soccer_players_filter
    select_tag(:filter, grouped_options_for_select(grouped_soccer_player_filter_options))
  end

  def soccer_players_order
    select_tag(:order, options_for_select(soccer_player_order_options))
  end

  def soccer_players_per_page
    select_tag(:per_page, options_for_select(per_page_options))
  end

  private

  def soccer_player_order_options
    [['Name ascendent', 'name ASC'], ['Name descendent', 'name DESC'],
     ['Age ascendent', 'age ASC'], ['Age descendent', 'age DESC']]
  end

  def grouped_soccer_player_filter_options
    [
      ['All',[['All soccer players','all_records']]],
      ['By Age',[['Children','child' ], ['Youth','young'],['Veteran','old']]],
      ['By level', [['Amateur','amateur'],['Semipro','semipro'],['Pro','pro']]],
      ['By status',[['Active','active'],['Retired','inactive']]]
    ]
  end

  def per_page_options
    (1..10)
  end

end
