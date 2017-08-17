//
//  ViewController.swift
//  PagingScrollViewWithNavigation
//
//  Created by naoya.watanabe on 2017/08/17.
//  Copyright © 2017年 naoya.watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var headerViewController: HeaderViewController!
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureHeaderView()
        self.scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func configureHeaderView() {
        self.headerViewController = storyboard?.instantiateViewController(withIdentifier: "HeaderViewController") as! HeaderViewController
        headerViewController.handler = { page in
            self.scrollTo(page: page)
        }
        let headerView = self.headerViewController.view
        headerView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        self.navigationItem.titleView = headerView
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollTo(page: Int) {
        let offsetX = self.view.frame.width * CGFloat(page)
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int((scrollView.contentOffset.x + (0.5 * scrollView.frame.size.width)) / scrollView.frame.size.width)
        self.headerViewController.currentPage = page
    }
}
