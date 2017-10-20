require 'carrierwave'

module GoGamefication
  module Concerns::Models::Medal
    extend ActiveSupport::Concern

    included do
      belongs_to :goal

      mount_uploader :image, ::GoGamefication::ImageUploader
    end
  end
end
