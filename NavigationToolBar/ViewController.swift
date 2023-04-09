//
//  ViewController.swift
//  NavigationToolBar
//
//  Created by JINSEOK on 2023/04/10.
//

import UIKit

class ViewController: UIViewController, UIToolbarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupToolBar()
    }
    
    func setupToolBar() {
        // 기본값은 true, 보이게 하려면 false로 설정
        navigationController?.isToolbarHidden = false
        setupAppearance()
        setupToolBarButton()
    }
    
    func setupAppearance() {
        
        let appearance = UIToolbarAppearance()
        // 불투명한 그림자를 한겹 쌓습니다.
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemOrange
        
        // 커스텀으로 ToolBar를 만들 땐 standardAppearance에서만 적용되더니,
        // 여기선 무조건 scrollEdgeAppearance에서만 적용되네요. 이상하네요...
        navigationController?.toolbar.scrollEdgeAppearance = appearance
    }
    
    func setupToolBarButton() {
        // 아이템에 따라 공간이 균등하게 분배합니다.
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let pauseButton = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: nil)
        let resetButton = UIBarButtonItem(title: "초기화", style: .plain, target: self, action: nil)
        let playButton = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: nil)
        
        // 공간을 만들어 주고 싶은 곳에 아이템을 추가해 줍니다. (자동으로 균등하게 만들어 줍니다)
        let barItems = [pauseButton, resetButton, playButton]
        let barItems1 = [pauseButton, flexibleSpace, resetButton, flexibleSpace, playButton]
        
        // 버튼 아이템들을 추가합니다.
        self.toolbarItems = barItems
        // 버튼을 변경할 때 부드러운 애니메이션효과와 같이 사용하고 싶다면 이런 메서드 있어요. (대신 사용 시 barItems이 변해야 겠죠?)
         self.setToolbarItems(barItems, animated: true)
    }
    
}


