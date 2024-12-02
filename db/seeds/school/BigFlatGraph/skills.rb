# Create the skills creator
creator = Creator.create!(
  label: "Development Skills Ontology",
  image: "dev_skills.png"
)

# Core Technology Atoms
react = Atom.create!(label: "React", creator_label: creator.label)
nodejs = Atom.create!(label: "Node.js", creator_label: creator.label)
rails = Atom.create!(label: "Ruby on Rails", creator_label: creator.label)

# Main Categories
frontend = Atom.create!(label: "Frontend Development", creator_label: creator.label)
backend = Atom.create!(label: "Backend Development", creator_label: creator.label)
# Reuse fullstack from students.rb
fullstack = Atom.find_by(label: "Fullstack")
testing = Atom.create!(label: "Testing and QA", creator_label: creator.label) # Renamed to avoid conflict
deployment = Atom.find_or_create_by!(label: "Deployment", creator_label: creator.label)
security = Atom.create!(label: "Security", creator_label: creator.label)
performance = Atom.create!(label: "Performance", creator_label: creator.label)
architecture = Atom.create!(label: "Architecture", creator_label: creator.label)
databases = Atom.create!(label: "Databases", creator_label: creator.label)
devops = Atom.create!(label: "DevOps", creator_label: creator.label)

# Predicates
# Reuse is_a from students.rb
is_a = Atom.find_by(label: "is a")
part_of = Atom.create!(label: "part of", creator_label: creator.label)
requires = Atom.create!(label: "requires", creator_label: creator.label)
uses = Atom.create!(label: "uses", creator_label: creator.label)
related_to = Atom.create!(label: "related to", creator_label: creator.label)
implements = Atom.create!(label: "implements", creator_label: creator.label)
enhances = Atom.create!(label: "enhances", creator_label: creator.label)
optimizes = Atom.create!(label: "optimizes", creator_label: creator.label)
secures = Atom.create!(label: "secures", creator_label: creator.label)
tests = Atom.create!(label: "tests", creator_label: creator.label)
deploys = Atom.create!(label: "deploys", creator_label: creator.label)
monitors = Atom.create!(label: "monitors", creator_label: creator.label)
manages = Atom.create!(label: "manages", creator_label: creator.label)
extends = Atom.create!(label: "extends", creator_label: creator.label)

# React Ecosystem
## Core React Concepts
react_concepts = [
  "JSX", "Virtual DOM", "Components", "Props", "State", "Lifecycle Methods",
  "Hooks", "Context", "Refs", "Portals", "Error Boundaries", "React.memo",
  "React.lazy", "Suspense", "Fragment", "StrictMode", "PropTypes",
  "Higher Order Components", "Render Props", "Custom Hooks", "Event Handling",
  "Controlled Components", "Uncontrolled Components", "Component Composition",
  "Pure Components", "Synthetic Events", "Server Components", "Client Components"
].map { |concept| Atom.create!(label: concept, creator_label: creator.label) }

## React State Management
state_management = [
  "Redux", "Redux Toolkit", "Redux Saga", "Redux Thunk", "MobX", "Recoil",
  "Zustand", "Jotai", "XState", "React Query", "SWR", "Apollo Client",
  "Context API", "useState", "useReducer", "useContext", "Redux Persist",
  "Immer", "Redux DevTools", "Redux Logger", "Redux Form", "Formik",
  "React Hook Form", "React Final Form"
].map { |tool| Atom.create!(label: tool, creator_label: creator.label) }

## React UI Libraries
ui_libraries = [
  "Material-UI", "Chakra UI", "Ant Design", "Tailwind CSS",
  "Styled Components", "Emotion", "CSS Modules", "SASS/SCSS", "Less",
  "Framer Motion", "React Spring", "React Transition Group", "React DnD",
  "React Beautiful DnD", "React Virtualized", "React Window", "React Grid",
  "React Table", "React Select", "React DatePicker", "React Color",
  "React Icons", "React Toastify", "React Modal", "React Popover",
  "React Tooltip", "React Slider", "React Tabs", "React Accordion"
].map { |lib| Atom.create!(label: lib, creator_label: creator.label) }

## React Testing
react_testing = [
  "React Testing Library", "Enzyme", "Cypress", "Playwright",
  "Storybook", "Mock Service Worker", "React Test Renderer", "React Test Utils",
  "Jest Snapshot Testing", "React Testing Playground", "React Test Selectors",
  "React Performance Testing", "React A11y Testing", "React Visual Testing",
  "React Integration Testing", "React Unit Testing", "React E2E Testing"
].map { |test_tool| Atom.create!(label: test_tool, creator_label: creator.label) }

## React Performance
react_performance = [
  "Code Splitting", "Tree Shaking", "Bundle Analysis", "Lazy Loading",
  "Memoization", "Debouncing", "Throttling", "Image Optimization",
  "React Profiler", "Performance Monitoring", "Bundle Size Optimization",
  "React DevTools Performance", "Chrome Performance Tools", "Lighthouse",
  "Web Vitals", "Performance Metrics", "React Performance API"
].map { |perf| Atom.create!(label: perf, creator_label: creator.label) }

## React Development Tools
react_tools = [
  "Create React App", "Next.js", "Gatsby", "Vite", "Webpack", "Babel",
  "ESLint", "Prettier", "React DevTools", "Chrome DevTools", "VS Code",
  "React Developer Tools Extension", "React Debug Tools", "React Hot Loader",
  "React Fast Refresh", "React Scripts", "React App Rewired", "CRACO"
].map { |tool| Atom.create!(label: tool, creator_label: creator.label) }

# Node.js Ecosystem
## Core Node.js Concepts
nodejs_concepts = [
  "Event Loop", "Streams", "Buffers", "Modules", "npm", "package.json",
  "Async/Await", "Promises", "Callbacks", "Error Handling", "Process",
  "Child Process", "Worker Threads", "File System", "Path",
  "URL", "HTTP/HTTPS", "Net", "Events", "Global Objects", "Console",
  "Timers", "Debugging", "Memory Management", "Garbage Collection"
].map { |concept| Atom.create!(label: concept, creator_label: creator.label) }

## Node.js Frameworks
node_frameworks = [
  "Express.js", "Nest.js", "Koa.js", "Fastify", "Hapi.js", "Sails.js",
  "Meteor.js", "Adonis.js", "Loopback", "Restify", "Feathers.js",
  "Socket.io", "GraphQL", "Apollo Server", "TypeGraphQL", "Prisma",
  "Sequelize", "Mongoose", "TypeORM", "Knex.js", "Objection.js"
].map { |framework| Atom.create!(label: framework, creator_label: creator.label) }

## Node.js Testing
node_testing = [
  "Mocha", "Chai", "Sinon", "Jest", "SuperTest", "Nock", "AVA", "Tape",
  "Lab", "Newman", "Artillery", "K6", "Unit Testing", "Integration Testing",
  "Load Testing", "API Testing", "Database Testing", "Mock Testing"
].map { |test_tool| Atom.create!(label: test_tool, creator_label: creator.label) }

## Node.js Security
node_security = [
  "Helmet", "CORS", "Rate Limiting", "JWT", "OAuth", "Passport.js",
  "bcrypt", "Crypto", "SSL/TLS", "XSS Protection", "CSRF Protection",
  "SQL Injection Prevention", "Security Headers", "Input Validation",
  "Authentication", "Authorization", "Session Management", "Secure Cookies"
].map { |security| Atom.create!(label: security, creator_label: creator.label) }

## Node.js Performance
node_performance = [
  "Clustering", "Load Balancing", "Memory Leaks", "CPU Profiling",
  "Memory Profiling",   "Benchmarking",
  "Response Time", "Throughput", "Scalability", "Resource Usage"
].map { |perf| Atom.create!(label: perf, creator_label: creator.label) }

# Ruby on Rails Ecosystem
## Core Rails Concepts
rails_concepts = [
  "MVC Pattern", "Active Record", "Action Controller", "Action View",
  "Active Storage", "Action Mailer", "Action Cable", "Active Job",
  "Active Support", "Migrations", "Routing", "Middleware", "Asset Pipeline",
  "Sprockets", "Credentials", "I18n", "Sessions", "Flash Messages", "Helpers", "Concerns",
  "Validations", "Associations", "Scopes", "Query Interface"
].map { |concept| Atom.create!(label: concept, creator_label: creator.label) }

## Rails Tools and Gems
rails_tools = [
  "Devise", "CanCanCan", "Pundit", "RSpec", "Factory Bot", "Capybara",
  "Sidekiq", "Delayed Job", "Action Text", "Action Mailbox", "Webpacker",
  "Stimulus", "Turbo", "Hotwire", "SimpleCov", "Rubocop", "Brakeman",
  "Better Errors", "Pry", "Bullet", "Rack Mini Profiler", "Paper Trail",
  "Kaminari", "Will Paginate", "Ransack", "Friendly ID", "CarrierWave",
  "Shrine", "Active Admin", "Rails Admin", "Grape", "Doorkeeper"
].map { |tool| Atom.create!(label: tool, creator_label: creator.label) }

## Rails Testing
rails_testing = [
  "Minitest", "VCR", "WebMock",
  "Cucumber",  "Shoulda Matchers",
  "Timecop", "Faker", "Test Unit", "System Tests",
  "Integration Tests", "Unit Tests", "Controller Tests", "Model Tests",
  "Mailer Tests", "Job Tests", "View Tests", "Route Tests"
].map { |test_tool| Atom.create!(label: test_tool, creator_label: creator.label) }

## Rails Security
rails_security = [
  "Mass Assignment Protection",
  "Session Security", "Password Security",  "Secure Headers",
  "Content Security Policy",
  "Output Encoding", "Secure File Upload", "Secure Configuration"
].map { |security| Atom.create!(label: security, creator_label: creator.label) }

## Rails Performance
rails_performance = [
  "Query Optimization", "Database Indexing", "N+1 Query Prevention",
  "Caching Strategies", "Background Jobs", "Asset Optimization", "Request Profiling", "Database Profiling", "APM Tools", "Scaling Rails"
].map { |perf| Atom.create!(label: perf, creator_label: creator.label) }

# Create relationships (just a sample - would need thousands more for complete coverage)
[ react, nodejs, rails ].each do |tech|
  Triple.create!(subject: tech, predicate: part_of, object: fullstack, creator: creator)
end

# Add relationships for each concept/tool to its parent technology
[
  [ react_concepts, react ],
  [ state_management, react ],
  [ ui_libraries, react ],
  [ react_testing, testing ],
  [ react_performance, performance ],
  [ react_tools, react ],
  [ nodejs_concepts, nodejs ],
  [ node_frameworks, nodejs ],
  [ node_testing, testing ],
  [ node_security, security ],
  [ node_performance, performance ],
  [ rails_concepts, rails ],
  [ rails_tools, rails ],
  [ rails_testing, testing ],
  [ rails_security, security ],
  [ rails_performance, performance ]
].each do |concepts, parent|
  concepts.each do |concept|
    # Ensure concept is an Atom before creating Triple
    if concept.is_a?(Atom)
      Triple.create!(subject: concept, predicate: part_of, object: parent, creator: creator)
    end
  end
end

# Add cross-technology relationships
Triple.create!(subject: react, predicate: uses, object: nodejs, creator: creator)
Triple.create!(subject: nodejs, predicate: enhances, object: react, creator: creator)
Triple.create!(subject: rails, predicate: uses, object: react, creator: creator)

# Add performance relationships
[ react_performance, node_performance, rails_performance ].flatten.each do |perf|
  # Ensure perf is an Atom before creating Triple
  if perf.is_a?(Atom)
    Triple.create!(subject: perf, predicate: optimizes, object: performance, creator: creator)
  end
end

# Add security relationships
[ node_security, rails_security ].flatten.each do |sec|
  # Ensure sec is an Atom before creating Triple
  if sec.is_a?(Atom)
    Triple.create!(subject: sec, predicate: secures, object: security, creator: creator)
  end
end

# Add testing relationships
[ react_testing, node_testing, rails_testing ].flatten.each do |test|
  # Ensure test is an Atom before creating Triple
  if test.is_a?(Atom)
    Triple.create!(subject: test, predicate: tests, object: testing, creator: creator)
  end
end
