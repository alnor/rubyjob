# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rubyjob_session',
  :secret      => '0953788b311e3795dc50db73a0b6e6f663ee684445b0ae21a4f99cf8b78d5e8e2317db6a67f071dd8071936c26c01c5cfd825d85c2a73a296e2f956fbc72dd77'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
