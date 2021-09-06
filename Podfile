# Uncomment the next line to define a global platform for your project

ENV['COCOAPODS_DISABLE_STATS'] = 'true'

platform :ios, '13.0'

target 'PourPour' do
# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  swift_version = "5"

  # ignore all warnings from all pods
  inhibit_all_warnings!

  pod 'R.swift'

    target 'PourPourTests' do
        inherit! :search_paths
    end

    target 'PourPourUITests' do
        inherit! :search_paths
    # Pods for testing
    end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end


