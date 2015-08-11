class RoundCreator
  include Interactor

  def call
    context[:round] = create_round
  end

  private

  def create_round
  end


end
