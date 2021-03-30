Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['GITHUB_KEY'], ENV['9d31f50b74ad213d074bffb4c37561b4ad4d3fa3']
  end