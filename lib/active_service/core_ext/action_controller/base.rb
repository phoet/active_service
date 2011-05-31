require 'action_controller'

class ActionController::Base
  include ActionService::ActionControllerExtension
  extend ActionService::ActionControllerExtension::ClassMethods
end