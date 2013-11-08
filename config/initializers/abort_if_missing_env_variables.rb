File.readlines(Rails.root.join ".env.example").map do |line|
  line =~ /\s*(\S+)\s*=/
  if $1 && ENV[$1].blank?
    abort "Application initialization failed: Missing ENV variable \"#{$1}\"\n" +
      "Check env.example and add this missing ENV variable " +
      "to your .env file or the Heroku config"
  end
end
