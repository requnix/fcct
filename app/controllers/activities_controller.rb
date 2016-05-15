class ActivitiesController < ApplicationController
  def index
    @events = Event.recent.listed.order 'occurs_on desc'
  end
end
