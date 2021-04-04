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
  require 'foto/requests/delete'
  require 'foto/requests/get'
  require 'foto/requests/put'
  require 'foto/requests/post'
  require 'foto/requests/partner_access_post'

  # Load the specific endpoint classes
  require 'foto/artifact'
  require 'foto/claim'
  require 'foto/discharge'
  require 'foto/episode'
  require 'foto/episode_setup'
  require 'foto/episode_survey_url'
  require 'foto/patient'
  require 'foto/patient_delete'
  require 'foto/visit'
end
