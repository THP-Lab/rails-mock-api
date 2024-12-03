# Create THP creator if not exists
creator = Creator.find_by(label: "The Hacking Project") ||
         Creator.create!(label: "The Hacking Project", image: "thp_logo.png")

# Main Program Structure
thp = Atom.find_by(label: "The Hacking Project") ||
      Atom.create!(label: "The Hacking Project", creator_label: creator.label)

# Reuse fullstack from students.rb
fullstack = Atom.find_by(label: "Fullstack")

# Course Phases
prep_course = Atom.create!(label: "Prep Course", creator_label: creator.label)
fundamentals = Atom.create!(label: "Programming Fundamentals", creator_label: creator.label)
web_basics = Atom.create!(label: "Web Development Basics", creator_label: creator.label)
ruby_phase = Atom.create!(label: "Ruby Programming", creator_label: creator.label)
rails_phase = Atom.create!(label: "Ruby on Rails Development", creator_label: creator.label)
js_phase = Atom.create!(label: "JavaScript & React", creator_label: creator.label)
final_project = Atom.create!(label: "Final Project", creator_label: creator.label)

# Predicates
is_part_of = Atom.find_by(label: "part of") ||
             Atom.create!(label: "is part of", creator_label: creator.label)
requires = Atom.find_by(label: "requires") ||
          Atom.create!(label: "requires", creator_label: creator.label)
teaches = Atom.create!(label: "teaches", creator_label: creator.label)
follows = Atom.create!(label: "follows", creator_label: creator.label)
includes = Atom.create!(label: "includes", creator_label: creator.label)

# Prep Course Topics
command_line = Atom.create!(label: "Command Line Basics", creator_label: creator.label)
git_basics = Atom.create!(label: "Git Basics", creator_label: creator.label)
github = Atom.create!(label: "GitHub", creator_label: creator.label)
html_css_basics = Atom.create!(label: "HTML & CSS Basics", creator_label: creator.label)

# Programming Fundamentals Topics
programming_logic = Atom.create!(label: "Programming Logic", creator_label: creator.label)
variables = Atom.create!(label: "Variables & Data Types", creator_label: creator.label)
control_flow = Atom.create!(label: "Control Flow", creator_label: creator.label)
functions = Atom.create!(label: "Functions", creator_label: creator.label)
arrays = Atom.create!(label: "Arrays", creator_label: creator.label)
hashes = Atom.create!(label: "Hashes", creator_label: creator.label)
loops = Atom.create!(label: "Loops", creator_label: creator.label)

# Web Development Basics Topics
html5 = Atom.create!(label: "HTML5", creator_label: creator.label)
css3 = Atom.create!(label: "CSS3", creator_label: creator.label)
responsive_design = Atom.create!(label: "Responsive Design", creator_label: creator.label)

# Ruby Programming Topics
ruby_oop = Atom.create!(label: "Ruby OOP", creator_label: creator.label)
ruby_methods = Atom.create!(label: "Ruby Methods", creator_label: creator.label)
ruby_blocks = Atom.create!(label: "Ruby Blocks", creator_label: creator.label)
ruby_modules = Atom.create!(label: "Ruby Modules", creator_label: creator.label)
ruby_testing = Atom.create!(label: "Ruby Testing", creator_label: creator.label)
ruby_gems = Atom.create!(label: "Ruby Gems", creator_label: creator.label)

# Rails Topics
mvc = Atom.create!(label: "MVC Architecture", creator_label: creator.label)
rails_routing = Atom.create!(label: "Rails Routing", creator_label: creator.label)
rails_controllers = Atom.create!(label: "Rails Controllers", creator_label: creator.label)
rails_views = Atom.create!(label: "Rails Views", creator_label: creator.label)
rails_forms = Atom.create!(label: "Rails Forms", creator_label: creator.label)
rails_auth = Atom.create!(label: "Rails Authentication", creator_label: creator.label)
rails_testing = Atom.create!(label: "Rails Testing", creator_label: creator.label)
rails_apis = Atom.create!(label: "Rails APIs", creator_label: creator.label)

# JavaScript & React Topics
js_fundamentals = Atom.create!(label: "JavaScript Fundamentals", creator_label: creator.label)
dom_manipulation = Atom.create!(label: "DOM Manipulation", creator_label: creator.label)
es6 = Atom.create!(label: "ES6 Features", creator_label: creator.label)
async_js = Atom.create!(label: "Asynchronous JavaScript", creator_label: creator.label)
react_basics = Atom.create!(label: "React Basics", creator_label: creator.label)
react_components = Atom.create!(label: "React Components", creator_label: creator.label)
react_state = Atom.create!(label: "React State Management", creator_label: creator.label)
react_hooks = Atom.create!(label: "React Hooks", creator_label: creator.label)
react_router = Atom.create!(label: "React Router", creator_label: creator.label)

# Final Project Components
project_planning = Atom.create!(label: "Project Planning", creator_label: creator.label)
agile_methods = Atom.create!(label: "Agile Methods", creator_label: creator.label)
git_workflow = Atom.create!(label: "Git Workflow", creator_label: creator.label)
deployment = Atom.find_by(label: "Deployment") ||
            Atom.create!(label: "Deployment", creator_label: creator.label)
presentation = Atom.create!(label: "Project Presentation", creator_label: creator.label)

# Create Program Structure
Triple.create!(subject: fullstack, predicate: is_part_of, object: thp, creator: creator)

# Phase Sequence
[ prep_course, fundamentals, web_basics, ruby_phase, rails_phase, js_phase, final_project ].each_cons(2) do |current, next_phase|
  Triple.create!(subject: next_phase, predicate: follows, object: current, creator: creator)
  Triple.create!(subject: current, predicate: is_part_of, object: fullstack, creator: creator)
end

# Prep Course Structure
[ command_line, git_basics, github, html_css_basics ].each do |topic|
  Triple.create!(subject: topic, predicate: is_part_of, object: prep_course, creator: creator)
end

# Programming Fundamentals Structure
[ programming_logic, variables, control_flow, functions, arrays, hashes, loops ].each do |topic|
  Triple.create!(subject: topic, predicate: is_part_of, object: fundamentals, creator: creator)
end

# Web Development Basics Structure
[ html5, css3, responsive_design ].each do |topic|
  Triple.create!(subject: topic, predicate: is_part_of, object: web_basics, creator: creator)
end

# Ruby Programming Structure
[ ruby_oop, ruby_methods, ruby_blocks, ruby_modules, ruby_testing, ruby_gems ].each do |topic|
  Triple.create!(subject: topic, predicate: is_part_of, object: ruby_phase, creator: creator)
end

# Rails Structure
[ mvc, rails_routing, rails_controllers, rails_views, rails_forms, rails_auth, rails_testing, rails_apis ].each do |topic|
  Triple.create!(subject: topic, predicate: is_part_of, object: rails_phase, creator: creator)
end

# JavaScript & React Structure
[ js_fundamentals, dom_manipulation, es6, async_js, react_basics, react_components, react_state, react_hooks, react_router ].each do |topic|
  Triple.create!(subject: topic, predicate: is_part_of, object: js_phase, creator: creator)
end

# Final Project Structure
[ project_planning, agile_methods, git_workflow, deployment, presentation ].each do |topic|
  Triple.create!(subject: topic, predicate: is_part_of, object: final_project, creator: creator)
end

# Dependencies
Triple.create!(subject: git_workflow, predicate: requires, object: git_basics, creator: creator)
Triple.create!(subject: rails_phase, predicate: requires, object: ruby_phase, creator: creator)
Triple.create!(subject: react_components, predicate: requires, object: js_fundamentals, creator: creator)
Triple.create!(subject: rails_apis, predicate: requires, object: mvc, creator: creator)
Triple.create!(subject: react_state, predicate: requires, object: react_basics, creator: creator)

# Teaching Relationships
Triple.create!(subject: prep_course, predicate: teaches, object: command_line, creator: creator)
Triple.create!(subject: ruby_phase, predicate: teaches, object: ruby_oop, creator: creator)
Triple.create!(subject: rails_phase, predicate: teaches, object: mvc, creator: creator)
Triple.create!(subject: js_phase, predicate: teaches, object: react_basics, creator: creator)

# Include Relationships
Triple.create!(subject: final_project, predicate: includes, object: rails_phase, creator: creator)
Triple.create!(subject: final_project, predicate: includes, object: js_phase, creator: creator)
Triple.create!(subject: final_project, predicate: includes, object: git_workflow, creator: creator)
