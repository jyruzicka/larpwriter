abort "can be run only in development" unless Rails.env.development?

joe  = User.create! email: "joe@example.com", password: "secret"
jack = User.create! email: "jack@example.com", password: "secret"
joe_larp = Larp.create! name: "Joe's larp"
