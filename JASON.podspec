Pod::Spec.new do |s|
  s.name         = "JASON"
  s.version      = "3.0"
  s.license      = { :type => "MIT" }
  s.homepage     = "https://github.com/delba/JASON"
  s.author       = { "Damien" => "damien@delba.io" }
  s.summary      = "Fast JSON parsing for Swift"
  s.source       = { :git => "https://github.com/delba/JASON.git", :tag => "v3.0" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"

  s.source_files = "Source/**/*.{swift,h}"

  s.requires_arc = true
end
