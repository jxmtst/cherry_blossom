# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
get '/', to: ->(env) { [200, {}, ['Hello CherryBlossom from Hanami!']] }

resources :issues
