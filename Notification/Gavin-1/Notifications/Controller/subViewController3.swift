//
//  subViewController3.swift
//  Notifications
//
//  Created by PinguMac on 2018/2/12.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation
import UIKit

class subViewController3: UIViewController {
  
  init() {
    super.init(nibName: nil, bundle: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(startGameNotify),
                                           name: .startDidSelect,
                                           object: nil)
  
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(resetGameNotify),
                                           name: .resetDidSelect,
                                           object: nil)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  let infoView = InfoView()
  weak var delegate: HomeViewDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.yellow
    
    self.view.addSubview(infoView)
  }
  
  @IBAction func startGameNotify() {
    infoView.hpVal1? -= 1
    infoView.hpValLabel1.text = String(infoView.hpVal1)
    
    updateSubView3()
  }
  
  @IBAction func resetGameNotify() {
    infoView.resetHp()
    infoView.hpValLabel1.text = String(infoView.hpVal1)
  }
  
  func updateSubView3() {
    delegate?.updateView3Info(subView3Hp: infoView.hpVal1)
  }
}