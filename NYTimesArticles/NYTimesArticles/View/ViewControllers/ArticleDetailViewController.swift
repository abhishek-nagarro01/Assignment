//
//  ArticleDetailViewController.swift
//  NYTimesArticles
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    var articleDetail: ArticleDetail?
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        if let mediaArray = articleDetail?.media, mediaArray.count > 0 {
            let media = mediaArray[0]
            if let caption = media.caption {
                captionTextView.text = caption
            }
            if let metaDataArray = media.mediaMetadata, metaDataArray.count > 0, let url = metaDataArray[0].url {
                articleImageView.sd_setImage(with: URL(string: url)!, completed: nil)
            }
        }
    }
}
