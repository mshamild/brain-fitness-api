class V1::RoundsController < V1::BaseController
  def show
    respond_with round
  end

  def update
    RoundUpdater.call(round: round, user: current_user, attributes: answers_params)

    render json: round
  end

  private

  def game
    @game ||= current_user.games.find(params[:game_id])
  end

  def round
    @round ||= game.rounds.find(params[:id])
  end

  def answers_params
    params.require(:round).permit(
      round_categories_attributes: [
        :id,
        :selected,
        round_questions_attributes: [
          :id,
          answers_attributes: [
            :answer_variant_id
          ]
        ]
      ]
    )
  end
end
