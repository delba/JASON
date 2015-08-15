#
#  Be sure to run `pod spec lint JASON.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "JASON"
  s.version      = "0.1"
  s.license      = { :type => "MIT" }
  s.homepage     = "https://github.com/delba/JASON"
  s.author       = { "Damien Delba" => "damien@delba.io" }
  s.summary      = "Fast JSON parsing for Swift"
  s.source       = { :git => "https://github.com/delba/JASON.git", :tag => "v0.1" }

  s.ios.deployment_target = "8.0"

  s.source_files = "Source/*.swift"

  s.requires_arc = true
end
