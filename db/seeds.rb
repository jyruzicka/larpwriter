abort "can be run only in development" unless Rails.env.development?

joe  = User.create! email: "joe@example.com", password: "secret"
joe_larp = Larp.create! name: "Joe's larp"
Organizer.create! user: joe, larp: joe_larp, first_name: "joe", email: "joe@example.com"
