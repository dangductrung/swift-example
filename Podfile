# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'test-rxswift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BasicRxSwift
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'SnapKit', '~> 5.6'
  pod 'Alamofire'
  pod 'RxDataSources'
  pod 'RxSwiftExt'
  pod 'PKHUD', '~> 5.0'
  pod 'Dip'
  pod 'ReSwift'
  pod 'ReSwiftThunk'
  
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
   installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if target.respond_to?(:product_type) and target.product_type == "com.trungdang.test.rxswift.test-rxswift"
        target.build_configurations.each do |config|
            config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        end
      end
    end
  end
end
