namespace :player do
  desc "Add a new Player from the command line"
  task :create => :environment do
    begin

        # Get the player interactively
        STDOUT.puts "Enter the new players credentials."

        STDOUT.print "Full name: "
        name = STDIN.gets.chomp

        STDOUT.print "Email address: "
        email = STDIN.gets.chomp

        STDOUT.print "Rating: "
        rating = STDIN.gets.chomp

        username = name.downcase.gsub(" ", "_")
        password = "#{username}pw1234"

        Player.create_with_rating(name: name, email: email.present? ? email : nil, rating: rating, admin: false, username: username, password: password)
        
    rescue ActiveRecord::RecordInvalid
        username = username + SecureRandom.hex(1)
        password = "#{username}pw1234"

        Player.create_with_rating(name: name, email: email.present? ? email : nil, rating: rating, admin: false, username: username, password: password)
    ensure
        exit(false)
    end
  end
end