# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_acts_as_seekable_session',
  :secret      => 'a59b8c91b82d13d4c8a804009d2f52d30e3d49a1a8f1ae67b8005c7d4676a505c732c2857330d9e8b7a673970330ec64fe7ee93a9a0d0de53e21e32d43a1d283'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
