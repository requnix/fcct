class CalendarsController < ApplicationController
  def index
    @events = Event.listed.order 'occurs_on asc'
  end
end
