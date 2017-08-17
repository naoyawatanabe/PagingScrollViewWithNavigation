//
//  HeaderViewController.swift
//  PagingScrollViewWithNavigation
//
//  Created by naoya.watanabe on 2017/08/17.
//  Copyright © 2017年 naoya.watanabe. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var currentBar: UIView!
    @IBOutlet weak var currentBarLeftConstraint: NSLayoutConstraint!
    var handler: ((_ page: Int) -> Void)?
    var currentPage: Int = 0 {
        didSet {
            self.update(page: currentPage)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func update(page: Int) {
        switch page {
        case 0:
            self.firstButton.setTitleColor(.black, for: .normal)
            self.secondButton.setTitleColor(.lightGray, for: .normal)
            self.thirdButton.setTitleColor(.lightGray, for: .normal)
        case 1:
            self.firstButton.setTitleColor(.lightGray, for: .normal)
            self.secondButton.setTitleColor(.black, for: .normal)
            self.thirdButton.setTitleColor(.lightGray, for: .normal)
        case 2:
            self.firstButton.setTitleColor(.lightGray, for: .normal)
            self.secondButton.setTitleColor(.lightGray, for: .normal)
            self.thirdButton.setTitleColor(.black, for: .normal)
        default:
            break
        }
        self.currentBarLeftConstraint.constant = self.currentBar.bounds.width * CGFloat(page)
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        self.currentPage = button.tag
        self.handler?(self.currentPage)
    }
    
}
