module Dashboard
  class BaseController < ApplicationController
    before_action :verify_admin
  end
end
