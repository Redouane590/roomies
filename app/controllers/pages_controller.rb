class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end
  def redirect
    client = Signet::OAuth2::Client.new(client_options)

    redirect_to client.authorization_uri.to_s, allow_other_host: true
  end


  def client_options
    {
      client_id: ENV["google_client_id"],
      client_secret: ENV["google_client_secret"],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    }
  end

  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to calendars_url
  end

  def calendars
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.authorization = client
    @event_list = @service.list_events("d3def9ad4e63c39cf1ee56730b1a603d67bdd96d927abd06f28efc026d2015fa@group.calendar.google.com")

    @calendar_list = @service.list_calendar_lists

  rescue Google::Apis::AuthorizationError
    response = client.refresh!

    session[:authorization] = session[:authorization].merge(response)


    retry
  end

  def events
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @event_list = service.list_events(params[:calendar_id])
  end

  def new_event
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    @event_list = service.list_events("d3def9ad4e63c39cf1ee56730b1a603d67bdd96d927abd06f28efc026d2015fa@group.calendar.google.com")
    today = Date.today

    event = Google::Apis::CalendarV3::Event.new(
                                                  start: Google::Apis::CalendarV3::EventDateTime.new(date: params[:start]),
                                                  end: Google::Apis::CalendarV3::EventDateTime.new(date: params[:end]),
                                                  summary: params[:name]
                                                )

    service.insert_event("d3def9ad4e63c39cf1ee56730b1a603d67bdd96d927abd06f28efc026d2015fa@group.calendar.google.com", event)

    redirect_to events_url("d3def9ad4e63c39cf1ee56730b1a603d67bdd96d927abd06f28efc026d2015fa@group.calendar.google.com")

  def calendar
  end
end
