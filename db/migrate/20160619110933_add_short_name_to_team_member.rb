class AddShortNameToTeamMember < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :short_name, :string
  end
end
