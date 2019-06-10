require 'yaml'

class OktaCredentialsProvider

  attr_reader :credentials

  def initialize
    cwd = File.dirname(__dir__)
    okta_credentials_file = File.join(cwd, '/support/constants/okta_credentials.yml')
    @credentials = YAML.load_file(okta_credentials_file)
  end

  def get_username(role)
    @credentials[role]['username']
  end

  def get_password(role)
    @credentials[role]['password']
  end
end
