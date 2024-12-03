require 'faker'

# Create THP as creator
thp = Creator.create!(label: 'The Hacking Project', image: 'thp_logo.png')

# Create basic concepts
is_a = Atom.create!(label: 'is a', creator_label: thp.label)
has_session = Atom.create!(label: 'has session', creator_label: thp.label)
enrolled_in = Atom.create!(label: 'enrolled in', creator_label: thp.label)
completed = Atom.create!(label: 'completed', creator_label: thp.label)
followed_by = Atom.create!(label: 'followed by', creator_label: thp.label)

# Create entity types
school = Atom.create!(label: 'School', creator_label: thp.label)
session = Atom.create!(label: 'Session', creator_label: thp.label)
student = Atom.create!(label: 'Student', creator_label: thp.label)

# Create journey stages
introduction = Atom.create!(label: 'Introduction', creator_label: thp.label)
fullstack = Atom.create!(label: 'Fullstack', creator_label: thp.label)
developer = Atom.create!(label: 'Developer', creator_label: thp.label)
developer_plus = Atom.create!(label: 'Developer++', creator_label: thp.label)

# Define THP as a school
Triple.create!(
  subject: thp,
  predicate: is_a,
  object: school,
  creator: thp
)

# Create sessions (last 12 months)
sessions = []
12.downto(1) do |i|
  month = (Date.today - i.months).strftime('%B %Y')
  session_atom = Atom.create!(label: "Session #{month}", creator_label: thp.label)
  sessions << session_atom

  # Link session to THP
  Triple.create!(
    subject: thp,
    predicate: has_session,
    object: session_atom,
    creator: thp
  )
end

# Create progression links between journey stages
Triple.create!(
  subject: introduction,
  predicate: followed_by,
  object: fullstack,
  creator: thp
)
Triple.create!(
  subject: fullstack,
  predicate: followed_by,
  object: developer,
  creator: thp
)
Triple.create!(
  subject: developer,
  predicate: followed_by,
  object: developer_plus,
  creator: thp
)

# Create 100 students with realistic names and progression patterns
100.times do |i|
  # Generate first and last name
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  full_name = "#{first_name} #{last_name}"

  # Create student atom
  student_atom = Atom.create!(label: full_name, creator_label: thp.label)

  # Create student creator
  student_creator = Creator.create!(
    label: full_name,
    image: Faker::Avatar.image(slug: full_name, size: '100x100', format: 'png')
  )

  # Define as student
  Triple.create!(
    subject: student_atom,
    predicate: is_a,
    object: student,
    creator: student_creator
  )

  # Randomly assign to a session (weighted towards recent sessions)
  session_index = rand ** 2 * sessions.length # Square to weight towards recent sessions
  student_session = sessions[session_index.to_i]

  # Enroll in session
  Triple.create!(
    subject: student_atom,
    predicate: enrolled_in,
    object: student_session,
    creator: student_creator
  )

  # Complete Introduction (all students)
  Triple.create!(
    subject: student_atom,
    predicate: completed,
    object: introduction,
    creator: student_creator
  )

  # 70% chance to complete Fullstack
  if rand < 0.7
    Triple.create!(
      subject: student_atom,
      predicate: completed,
      object: fullstack,
      creator: student_creator
    )

    # 50% chance to complete Developer (if completed Fullstack)
    if rand < 0.5
      Triple.create!(
        subject: student_atom,
        predicate: completed,
        object: developer,
        creator: student_creator
      )

      # 30% chance to complete Developer++ (if completed Developer)
      if rand < 0.3
        Triple.create!(
          subject: student_atom,
          predicate: completed,
          object: developer_plus,
          creator: student_creator
        )
      end
    end
  end
end
