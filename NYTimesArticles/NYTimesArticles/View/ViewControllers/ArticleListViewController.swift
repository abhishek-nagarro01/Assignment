//
//  ArticleListViewController.swift
//  NYTimesArticles
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit
import SVProgressHUD

class ArticleListViewController: UIViewController {
    
    let viewModel = ArticleListViewModel()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewModel.fetchArticleLsit()
        SVProgressHUD.show()
        viewModel.articleList.bind { [unowned self] in
            if $0 != nil {
                SVProgressHUD.dismiss()
                self.tableView.reloadData()
            }
        }
        viewModel.errorMessage.bind { [unowned self] in
            let errorMessage = $0
            if let error = errorMessage {
                SVProgressHUD.dismiss()
                self.showAlert(message: error)
            }
        }
    }
    
    private func showAlert(message: String) {
        
        let alert = UIAlertController(title: "Error!!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueConstants.kShowDetailSegue {
            let articleDetail = segue.destination as? ArticleDetailViewController
            articleDetail?.articleDetail = sender as? ArticleDetail
        }
    }
}

extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let articles = viewModel.articleList.value {
            return articles.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = Identifiers.kArticleListTableCellIdentifier
        let cell = (tableView.dequeueReusableCell(withIdentifier: identifier,
                                                 for: indexPath) as? ArticleListTableCell)!
        let articleDetail = viewModel.articleList.value?[indexPath.row]
        cell.bindData(articleDetails: articleDetail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleDetail = viewModel.articleList.value?[indexPath.row]
        performSegue(withIdentifier: SegueConstants.kShowDetailSegue, sender: articleDetail)
    }
}
