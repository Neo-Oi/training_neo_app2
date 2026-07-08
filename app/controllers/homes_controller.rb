class HomesController < ApplicationController
    skip_before_action :role_init
end