abort "can be run only in development" unless Rails.env.development?

joe = User.create! email: "joe@example.com", password: "secret"

joe_larp = Larp.create! name: "Joe's larp"

joe_larp.organizers.create! user: joe, first_name: "joe", email: "joe@example.com"

%i(pcs npcs documents).each do |asset_type_plural|
  5.times { |i| joe_larp.send(asset_type_plural).create! name: "#{asset_type_plural.to_s.chop} ##{i}"}
end

%i(players npc_players).each do |asset_type_plural|
  5.times { |i| joe_larp.send(asset_type_plural).create! email: "#{asset_type_plural.to_s.chop}##{i}@example.com", first_name: "#{asset_type_plural.to_s.chop} ##{i}"}
end
