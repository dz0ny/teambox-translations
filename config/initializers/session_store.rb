# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_prevod_session',
  :secret      => '8b031d19dd9d42292b1114f9c079a096aa8fd0a7831f945ad1a5e1d35e00ebc267e9d0db5e8c6f87898bafc52dbfa5ed91e1e6a2af7ae8eb2aafcf702915e9e4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
