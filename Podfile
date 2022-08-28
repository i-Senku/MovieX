# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

def global_pods
  use_frameworks!

  pod 'TinyConstraints', '~> 4.0'
  pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher', :branch => 'version6-xcode13'
end

workspace 'MovieX'

target 'MovieX' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MovieX
  global_pods

  # Network
  pod 'Alamofire', '~> 5.4'

  # UI
  pod 'SwiftEntryKit', '2.0.0'
  pod 'lottie-ios'

  # Helper
  pod 'Firebase/RemoteConfig'
  pod 'Firebase/Core'
  pod 'FirebaseMessaging'

end

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  global_pods
  
  # Generater
  pod 'SwiftGen', '~> 6.5.1'
 
  # UI
  pod 'lottie-ios'

end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider
  
  # Network
  pod 'Alamofire', '~> 5.4'

end
