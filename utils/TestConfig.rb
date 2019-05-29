class TestConfig

  attr_reader :envName
  attr_reader :loginURL
  attr_reader :pageTimeOut
  attr_reader :objectTimeOut

  def initialize(envName, loginURL, pageTimeOut, objectTimeOut)
    @envName = envName
    @loginURL = loginURL
    @pageTimeOut = pageTimeOut
    @objectTimeOut = objectTimeOut
  end
end