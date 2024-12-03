class Api::V1::GraphController < Api::BaseController
  def index
    render_graph_data
  end

  def create
    if request.content_type == 'application/json' && request.raw_post.include?('query')
      # Gestion de la requête GraphQL
      handle_graphql_request
    else
      # Gestion de la requête REST standard
      handle_rest_request
    end
  end

  private

  def handle_graphql_request
    query = JSON.parse(request.raw_post)['query']
    if query.include?('triples')
      triples_data = Triple.includes(:subject, :predicate, :object).limit(500).map do |triple|
        {
          id: triple.id,
          subject: {
            label: triple.subject.label,
            id: triple.subject.label # Utiliser le label comme ID pour les atomes
          },
          predicate: {
            label: triple.predicate.label,
            id: triple.predicate.label
          },
          object: {
            label: triple.object.label,
            id: triple.object.label
          }
        }
      end
      render json: { data: { triples: triples_data } }
    else
      render json: { error: "Requête GraphQL non supportée" }, status: :unprocessable_entity
    end
  rescue JSON::ParserError
    render json: { error: "Format de requête invalide" }, status: :bad_request
  end

  def handle_rest_request
    begin
      creator = Creator.find_or_create_by!(
        label: 'The Hacking Project',
        image: 'thp_logo.png'
      )

      subject = Atom.where(label: triple_params[:subject_label]).first_or_initialize.tap do |atom|
        atom.creator = creator
        atom.save!
      end

      predicate = Atom.where(label: triple_params[:predicate_label]).first_or_initialize.tap do |atom|
        atom.creator = creator
        atom.save!
      end

      object = Atom.where(label: triple_params[:object_label]).first_or_initialize.tap do |atom|
        atom.creator = creator
        atom.save!
      end

      triple = Triple.create!(
        subject: subject,
        predicate: predicate,
        object: object,
        creator: creator
      )

      render_graph_data
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: "Erreur de validation: #{e.message}" }, status: :unprocessable_entity
    rescue StandardError => e
      render json: { error: "Une erreur est survenue: #{e.message}" }, status: :internal_server_error
    end
  end

  def triple_params
    params.require(:triple).permit(:subject_label, :predicate_label, :object_label)
  end

  def render_graph_data
    triples = Triple.includes(:subject, :predicate, :object, :creator).map do |triple|
      {
        id: triple.id,
        label: triple.label,
        type: 'Triple',
        subject: {
          id: triple.subject.label,
          label: triple.subject.label,
          type: triple.subject_type
        },
        predicate: {
          id: triple.predicate.label,
          label: triple.predicate.label,
          type: triple.predicate_type
        },
        object: {
          id: triple.object.label,
          label: triple.object.label,
          type: triple.object_type
        },
        creator: triple.creator.label
      }
    end

    atoms = Atom.includes(:creator).map do |atom|
      {
        id: atom.label,
        label: atom.label,
        type: 'Atom'
      }
    end

    render json: {
      data: {
        atoms: atoms + triples
      }
    }
  end
end
