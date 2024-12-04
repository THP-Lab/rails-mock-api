# Liste des options disponibles
options = ["smallNestedGraph", "BigFlatGraph", "CSVPopulator", "Empty ( I'll generate the data myself from the triples creation view ) "]

# Si SEED_OPTION est défini, utiliser cette valeur
if ENV['SEED_OPTION']
  choice = options.index(ENV['SEED_OPTION'])&.+(1)
else
  # Affiche les options
  puts "Available options in db/seeds/school:"
  options.each_with_index { |option, index| puts "#{index + 1}. #{option}" }

  # Demande à l'utilisateur de choisir une option
  print "Choose an option (number): "
  choice = gets.chomp.to_i
end

# Vérifie le choix et exécute la seed correspondante
if choice&.between?(1, options.length)
  selected_option = options[choice - 1]
  
  if selected_option == options[3]
    puts "Creating empty database structure..."
  else
    seed_file = File.join(__dir__, 'seeds', 'school', selected_option, 'seed.rb')
    puts "Running #{seed_file}..."
    load seed_file
  end
else
  puts "Invalid choice. Exiting."
end
