# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
#ActionController::Base.session = {
#  :key         => '_MyMullet.org_session',
#  :secret      => 'b760348c553f1986868d4989634b2a199e9fc2478ce9c7d56cea745f1be0858fdc8add88d63dd416ddc811c9f35388eab6ed90d0cf85f54204013160e641d709'
#}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
