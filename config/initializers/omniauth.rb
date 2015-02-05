OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1499379517003281', '765e1e8a12163d30156ac198aecf1888'
end