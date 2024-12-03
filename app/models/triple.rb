class Triple < ApplicationRecord
  self.primary_key = "id"

  belongs_to :creator, primary_key: "label", foreign_key: "creator_label"

  # Polymorphic relationships for components
  belongs_to :subject, polymorphic: true
  belongs_to :predicate, polymorphic: true
  belongs_to :object, polymorphic: true

  # Polymorphic relationships for being used in other triples
  has_many :asSubject, as: :subject, class_name: "Triple"
  has_many :asPredicate, as: :predicate, class_name: "Triple"
  has_many :asObject, as: :object, class_name: "Triple"

  # Computed ID based on components
  before_validation :set_computed_id
  validates :id, uniqueness: { message: "This triplet already exists" }

  # Label method for when Triple is used as a component
  def label
    id.gsub('_', ' ')
  end

  private

  def set_computed_id
    subject_label = subject.respond_to?(:label) ? subject.label : subject.id
    predicate_label = predicate.respond_to?(:label) ? predicate.label : predicate.id
    object_label = object.respond_to?(:label) ? object.label : object.id
    
    self.id = "#{subject_label} #{predicate_label} #{object_label}"
  end
end
