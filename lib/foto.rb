require 'yajl'
require 'foto/version'

module Foto
  # Load the plumbing
  require 'foto/client'
  require 'foto/config'
  require 'foto/consumer'
  require 'foto/json_date'

  # Load the request types
  require 'foto/requests/request'
  require 'foto/requests/response'
  require 'foto/requests/get'
  require 'foto/requests/put'
  require 'foto/requests/post'

  # Load the specific endpoint classes
  require 'foto/claim'
  require 'foto/discharge'
  require 'foto/episode'
  require 'foto/episode_setup'
  require 'foto/episode_survey_url'
  require 'foto/patient'
end
