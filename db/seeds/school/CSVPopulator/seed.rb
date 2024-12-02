require 'csv'

puts "Starting CSV-based data population..."

# Clear existing data
puts "Clearing existing data..."
Triple.destroy_all
Atom.destroy_all
Creator.destroy_all

# Create system creator
puts "Creating system creator..."
Creator.create!(
  label: 'system',
  image: 'https://avatars.githubusercontent.com/u/583231?v=4' # Default GitHub octocat image
)

# Import atoms
puts "Importing atoms from CSV..."
CSV.foreach(Rails.root.join('db/seeds/atoms.csv'), headers: true) do |row|
  Atom.create!(
    label: row['label'],
    creator_label: row['creator_label']
  )
end

# Import triples
puts "Importing triples from CSV..."
CSV.foreach(Rails.root.join('db/seeds/triples.csv'), headers: true) do |row|
  Triple.create!(
    id: row['id'],
    subject_type: row['subject_type'],
    subject_id: row['subject_id'],
    predicate_type: row['predicate_type'],
    predicate_id: row['predicate_id'],
    object_type: row['object_type'],
    object_id: row['object_id'],
    creator_label: row['creator_label'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

puts "CSV data population completed successfully!"
