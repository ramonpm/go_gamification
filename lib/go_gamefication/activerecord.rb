module GoGamefication::ActiveRecord
  module Extensions
    def rewarding
      include GoGamefication::Concerns::Rewarding
    end

    def rewardable
      include GoGamefication::Concerns::Rewardable
    end
  end
end

::ActiveRecord::Base.send :extend, GoGamefication::ActiveRecord::Extensions if defined?(ActiveRecord)