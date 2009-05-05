module TeamsHelper

  def teams_filter
    select_tag(:filter, grouped_options_for_select(grouped_team_filter_options))
  end

  def teams_order
    select_tag(:order, options_for_select(team_order_options))
  end

  private

  def team_order_options
    [['Name ascendent', 'name ASC'], ['Name descendent', 'name DESC'],
     ['Championships ascendent', 'championships ASC'],
     ['Championships descendent', 'championships DESC'],
     ['City ascendent', 'city ASC'], ['City descendent', 'city DESC'],
     ['State ascendent', 'state ASC'], ['State descendent', 'state DESC']
     ]
  end

  def grouped_team_filter_options
    [
      ['All',[['All teams','all_records']]],
      ['By Championships',[['Rulers','ruler' ], ['Noobs','noob']]],
      ['By level', [['Amateur','amateur'],['Semipro','semipro'],['Pro','pro']]],
    ]
  end
end
