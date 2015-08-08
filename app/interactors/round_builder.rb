class RoundBuilder
  include Interactor

  def call
    context[:round] = build_round
  end

  private

  delegate :new, to: :Round, prefix: true

  def build_round
    round_new do |round|

    end
  end
end
