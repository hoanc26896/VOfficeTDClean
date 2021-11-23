platform :ios, '10.0'

def pods
    # Clean Architecture
    pod 'MGArchitecture', '~> 2.0.1'
    pod 'MGAPIService', '~> 3.0.0'
    pod 'MGLoadMore', '~> 3.0.2'
    pod 'Dto'

    # Rx
    pod 'RxViewController'

    # Core
    pod 'Reusable', '~> 4.1'
    pod 'Then', '~> 2.7'
    pod 'SnapKit'

    # Others
    pod 'MBProgressHUD', '~> 1.2'
    pod 'SDWebImage', '~> 5.8.3'
    pod 'SwiftGen', '~> 6.0'
#    pod 'ChameleonFramework/Swift'
end

def test_pods
    pod 'RxTest', '~> 5.1'
end

target 'VOfficeiPhoneNew' do
    use_frameworks!
    inhibit_all_warnings!
    pods

    target 'VOfficeiPhoneNewTests' do
        inherit! :search_paths
        test_pods
    end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 10.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
      end
    end
  end
end
