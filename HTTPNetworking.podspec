Pod::Spec.new do |s|
  s.name = "HTTPNetworking"
  s.version = "1.0.0"
  s.summary = "Network Utility Wrapper"
  s.homepage = "https://github.com/thinkaboutiter/HTTPNetworking.git"
  s.license = {
    :type => "Copyright",
    :file => "LICENSE"
  }
  s.author = {
    "Thinka Boutiter" => "thinkaboutiter@gmail.com"
  }
  s.source = {
    :git => "https://github.com/thinkaboutiter/HTTPNetworking.git",
    :tag => s.version
  }
  s.platform = :ios, "10.3"
  s.requires_arc = true
  s.source_files = "Sources/**/*"

  # dependencies
  s.dependency "Alamofire", "~> 4.6"
  s.dependency "ObjectMapper", "~> 3.1"
  s.dependency "OAuthSwift", "~> 1.2"
end