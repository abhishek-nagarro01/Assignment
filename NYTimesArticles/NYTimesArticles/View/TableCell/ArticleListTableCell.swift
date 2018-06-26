//
//  ArticleListTableCell.swift
//  NYTimesArticles
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleListTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        screenSetup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleImageView.image = nil
    }
    
    func screenSetup() {
        articleImageView.layer.cornerRadius = articleImageView.frame.size.width/2
        articleImageView.layer.masksToBounds = true
    }
    
    func bindData(articleDetails: ArticleDetail?) {
        titleLabel.text = articleDetails?.title
        bylineLabel.text = articleDetails?.byline
        dateLabel.text = articleDetails?.publishedDate
        if let mediaArray = articleDetails?.media, mediaArray.count > 0,
            let metaDataArray = mediaArray[0].mediaMetadata, metaDataArray.count > 0,
            let url = metaDataArray[0].url {
            
            articleImageView.sd_setImage(with: URL(string: url)!, completed: nil)
        }
    }
}
