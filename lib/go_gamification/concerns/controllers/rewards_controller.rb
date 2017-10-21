module GoGamification
  module Concerns::Controllers::RewardsController
    extend ActiveSupport::Concern

    included do
      before_action :verify_checksum

      def create
        if rewarding.is_a? ::GoGamification::Goal
          rewarding.complete_for rewardable
        else
          rewarding.goals.each do |goal|
            goal.complete_for rewardable
          end
        end

        respond_to do |format|
          format.json { render json: {}, status: :created }
          format.html { redirect_to redirect_url }
        end
      end

      private

      def verify_checksum
        render text: "Invalid checksum", status: :forbidden unless Checksum.verify(params[:checksum],
          [rewarding.class.name, rewarding.id, rewardable.class.name, rewardable.id])
      end

      def redirect_url
        params[:redirect_url] || request.env['HTTP_REFERER']
      end

      def rewarding
        rewarding_model.find reward_params[:rewarding_id]
      end

      def rewardable
        rewardable_model.find reward_params[:rewardable_id]
      end

      def rewarding_model
        reward_params[:rewarding_type].constantize
      end

      def rewardable_model
        reward_params[:rewardable_type].constantize
      end

      def reward_params
        params.require(:reward).permit(:rewarding_type, :rewarding_id, :rewardable_type, :rewardable_id)
      end
    end
  end
end
