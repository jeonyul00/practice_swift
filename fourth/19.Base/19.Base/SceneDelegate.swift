//
//  SceneDelegate.swift
//  19.Base
//
//  Created by 전율 on 7/3/24.
//

import UIKit

// 스크린 > 씬 > 윈도우 > 뷰 컨트롤러, 뷰
/*
 스크린(Screen):
 스크린은 물리적인 디스플레이를 나타냅니다.
 기계적인 부분으로, 주로 이미지 해상도와 같은 정보를 제공합니다.
 개발자가 직접 무언가를 개발할 일은 거의 없습니다.
 UIScreen.main을 통해 주 스크린에 접근할 수 있습니다.
 예: UIScreen.main.scale는 화면의 해상도를 나타냅니다.
 
 씬(Scene):
 iOS 13 이전에는 씬이라는 개념이 없었습니다.
 여러 윈도우를 동시에 사용할 수 있도록 도입되었습니다.
 예: 메모 앱에서 두 개의 문서를 동시에 열어 놓는 상황을 지원합니다.
 씬은 하나의 UI 사용자 인터페이스를 나타냅니다.
 
 윈도우(Window):
 뷰나 뷰 컨트롤러를 올리는 배경입니다.
 실질적으로 작업할 수 있는 UI의 배경이 됩니다.
 UIWindow는 화면에 표시되는 모든 콘텐츠의 루트입니다.

 */
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
        
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        /*
         씬이 처음 연결될 때 호출됩니다.
         초기 UI 설정을 여기서 할 수 있습니다.
         */
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        /*
         씬이 연결 해제될 때 호출됩니다.
         씬이 해제될 때 필요한 정리 작업을 수행할 수 있습니다.
         */
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        /*
         씬이 활성 상태가 되었을 때 호출됩니다.
         씬이 활성화되면 필요한 작업을 수행할 수 있습니다.
         */
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        /*
         씬이 비활성 상태로 전환될 때 호출됩니다.
         씬이 비활성화되기 전에 필요한 작업을 수행할 수 있습니다.
         */
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        /*
         씬이 포그라운드로 전환될 때 호출됩니다.
         씬이 포그라운드로 들어갈 때 필요한 작업을 수행할 수 있습니다.
         */
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        /*
         씬이 백그라운드로 전환될 때 호출됩니다.
         씬이 백그라운드로 들어갈 때 필요한 작업을 수행할 수 있습니다.

         */
        
    }


}

