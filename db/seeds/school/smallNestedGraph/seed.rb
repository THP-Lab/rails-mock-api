require 'faker'

# Utility method to find or create an atom
def find_or_create_atom(label, creator_label, creator)
  Atom.find_by(label: label, creator_label: creator_label) ||
    Atom.create!(label: label, creator_label: creator_label, creator: creator)
end

# Utility method to create triples safely
def create_triple(subject, predicate, object, creator)
  object_atom = object.is_a?(String) ? find_or_create_atom(object, creator.label, creator) : object
  Triple.find_by(subject: subject, predicate: predicate, object: object_atom, creator: creator) ||
    Triple.create!(subject: subject, predicate: predicate, object: object_atom, creator: creator)
end

# Utility method to create a triple on a triple
def create_nested_triple(inner_subject, inner_predicate, inner_object, outer_predicate, outer_object, creator)
  inner_triple = create_triple(inner_subject, inner_predicate, inner_object, creator)
  create_triple(inner_triple, outer_predicate, outer_object, creator)
end

# Create main creator
creator = Creator.find_or_create_by!(label: 'The Hacking Project', image: 'thp_logo.png')

# Create common predicates
is = find_or_create_atom('is', creator.label, creator)
offers = find_or_create_atom('offers', creator.label, creator)
includes = find_or_create_atom('includes', creator.label, creator)
uses = find_or_create_atom('uses', creator.label, creator)
belongs_to = find_or_create_atom('belongs to', creator.label, creator)
teaches = find_or_create_atom('teaches', creator.label, creator)
develops = find_or_create_atom('develops', creator.label, creator)

# Create main entities
thp = find_or_create_atom('THP', creator.label, creator)
backend_training = find_or_create_atom('Backend Training', creator.label, creator)
frontend_training = find_or_create_atom('Frontend Training', creator.label, creator)
fullstack_training = find_or_create_atom('Fullstack Training', creator.label, creator)

# Technologies
postgresql = find_or_create_atom('PostgreSQL', creator.label, creator)
javascript = find_or_create_atom('JavaScript', creator.label, creator)
ruby_on_rails = find_or_create_atom('Ruby on Rails', creator.label, creator)
react = find_or_create_atom('React', creator.label, creator)
html = find_or_create_atom('HTML', creator.label, creator)
css = find_or_create_atom('CSS', creator.label, creator)

# Backend Training and its technologies
create_nested_triple(
  backend_training, uses, postgresql,
  belongs_to, thp,
  creator
)

create_nested_triple(
  backend_training, uses, ruby_on_rails,
  belongs_to, thp,
  creator
)

# Frontend Training and its technologies
create_nested_triple(
  frontend_training, uses, html,
  belongs_to, thp,
  creator
)

create_nested_triple(
  frontend_training, uses, css,
  belongs_to, thp,
  creator
)

create_nested_triple(
  frontend_training, uses, javascript,
  belongs_to, thp,
  creator
)

# Fullstack Training and its technologies
create_nested_triple(
  fullstack_training, uses, javascript,
  belongs_to, thp,
  creator
)

create_nested_triple(
  fullstack_training, uses, ruby_on_rails,
  belongs_to, thp,
  creator
)

create_nested_triple(
  fullstack_training, uses, react,
  belongs_to, thp,
  creator
)

# Projects
rails_api_project = find_or_create_atom('Rails API Project', creator.label, creator)

create_nested_triple(
  rails_api_project, uses, postgresql,
  belongs_to, backend_training,
  creator
)

create_nested_triple(
  rails_api_project, uses, ruby_on_rails,
  belongs_to, backend_training,
  creator
)

# Teaching relationships
create_nested_triple(
  thp, teaches, javascript,
  belongs_to, fullstack_training,
  creator
)

create_nested_triple(
  thp, teaches, ruby_on_rails,
  belongs_to, fullstack_training,
  creator
)

create_nested_triple(
  thp, teaches, postgresql,
  belongs_to, backend_training,
  creator
)

# Development relationships
rest_api = find_or_create_atom('REST API', creator.label, creator)

create_nested_triple(
  rails_api_project, develops, rest_api,
  belongs_to, backend_training,
  creator
)

puts "Nested triples creation completed successfully!"
puts "Total atoms created: #{Atom.count}"
puts "Total relationships created: #{Triple.count}"
