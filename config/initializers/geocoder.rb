Geocoder.configure(
  timeout: 20, 
  lookup: :google, 
  ip_lookup: :freegeoip,
  language: :en,
  use_https: false,
  http_proxy: nil,
  https_proxy: nil,
  api_key: nil,
  cache: nil,
  cache_prefix: 'geocoder:',

  always_raise: [],

  units: :mi,
  distances: :linear
)
