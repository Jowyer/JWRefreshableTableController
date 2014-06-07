#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "JWRefreshableTableController"
  s.version          = "0.1.3"
  s.summary          = "TableView with Pull-Refresh & Load-More."
  s.description      = "TableView with Pull-Refresh & Load-More. ARC compatible. Modified with EGORefreshCluster."
  s.homepage         = "https://github.com/Jowyer/JWRefreshableTableController"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jowyer" => "jowyer@gmail.com" }
  s.source           = { :git => "https://github.com/Jowyer/JWRefreshableTableController.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/EXAMPLE'

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes/JWRefreshTableCluster/*'
  # s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'QuartzCore'
  # s.dependency 'JSONKit', '~> 1.4'
end
