module GoGamefication::Concerns::Rewardable
  extend ActiveSupport::Concern

  included do
    has_many :rewards, class_name: '::GoGamefication::Reward', as: :rewardable
    has_many :goals, through: :rewards, class_name: '::GoGamefication::Goal'

    def medals
      rewards.includes(goal: :medal).collect(&:medal).compact || []
    end
  end
end
