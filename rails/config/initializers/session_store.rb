# Be sure to restart your server when you modify this file.

# cannot disable session store completely, as activeadmin with devise
# requires it. However, no session cookie is being sent when doing an
# XML/JSON request. Otherwise that would fuck up with ember on the frontend.
Hydra::Application.config.session_store :cookie_store, key: '_hydra_session'
