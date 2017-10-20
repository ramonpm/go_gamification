require_dependency "go_gamification/application_controller"

module GoGamefication
  class RewardsController < ApplicationController
    include GoGamefication::Concerns::Controllers::RewardsController
  end
end
