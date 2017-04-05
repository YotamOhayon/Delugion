#
# Be sure to run `pod lib lint Delugion.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# Tso learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Delugion'
  s.version          = '1.0.0'
  s.summary          = 'A simple iOS client framework for Deluge.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yotamoo/Delugion'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yotamo' => 'ohayon.yotam@gmail.com' }
  s.source           = { :git => 'https://github.com/yotamoo/Delugion.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Delugion/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Delugion' => ['Delugion/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire', '~> 4.5'
  s.dependency 'Himotoki', '~> 3.1'

# s.subspec 'Rx' do |rx|
#   rx.dependency 'RxSwift', '~> 4.0'
#   rx.source_files = 'Delugion/Rx/**/*'
# end

end
