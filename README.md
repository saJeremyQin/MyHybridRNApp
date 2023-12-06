# MyHybridRNApp

This is a test project to verify intergrating React Native to an existing Swift project. 
Follow https://reactnative.dev/docs/integration-with-existing-apps?package-manager=yarn , but some steps make them clear.

Background Info
1. Swift project
   Since 2048 is no avaiable now, I created one proejct of showing random photoes using unsplash random api.
2. Versions
   for the RN
     "dependencies": {
    "react": "18.2.0",
    "react-native": "^0.72.7"
   }
   XCode 14.2, CocoaPods, 1.14.3
3. master branch only import a view from RN through bundleURL using RCTRootView, if comuncations through bridge, use RCTBridge, to be done.

Key steps
   1) Podfile
      this is for cocoapods, to import depenencies you will use. Notify this
      ' __apply_Xcode_12_5_M1_post_install_workaround(installer)' it works for 0.72.7, for other version, try remove this
   2) didTapGoButton
      This is for import RN view.
