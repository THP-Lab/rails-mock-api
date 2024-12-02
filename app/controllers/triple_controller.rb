class TripleController < ApplicationController
  def index
    @atoms = Atom.all
     render 'triple/index'
  end

  def create
    triple = Triple.new(triple_params)
    if triple.save
      render json: { data: { triple: triple } }, status: :created
    else
      render json: { error: triple.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def triple_params
    params.require(:triple).permit(:subject_label, :predicate_label, :object_label)
  end
end
