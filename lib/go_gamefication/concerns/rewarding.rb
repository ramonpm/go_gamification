module GoGamefication::Concerns::Rewarding
  extend ActiveSupport::Concern

  included do
    has_many :goals, class_name: '::GoGamefication::Goal', as: :rewarding
  end
end
