//
//  ExploreContentCellTableViewCell.swift
//  ANF Code Test
//
//  Created by Daniel Espinosa on 10/13/21.
//

import UIKit

class ExploreContentCell: UITableViewCell {
    
    var exploreItem: ExploreItem?
    
    var mainImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var topDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var promoMessageLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var bottomDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.textAlignment = .right
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        return textView
    }()
    
    var contentItemsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContentItemsCell.self, forCellReuseIdentifier: "ContentItemsCell")
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    var mainImageBottomAnchor: NSLayoutConstraint? = nil
    var topDescriptionHeightAnchor: NSLayoutConstraint? = nil
    var titleLabelHeightAnchor: NSLayoutConstraint? = nil
    var promoMessageLabelHeightAnchor: NSLayoutConstraint? = nil
    var bottomDescriptionHeightAnchor: NSLayoutConstraint? = nil
    var contentItemsHeightAnchor: NSLayoutConstraint? = nil

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func layoutViews(){
        self.backgroundColor = UIColor().anf_tan()

        
        self.addSubview(mainImageView)
        self.addSubview(topDescriptionLabel)
        self.addSubview(titleLabel)
        self.addSubview(promoMessageLabel)
        self.addSubview(bottomDescriptionTextView)
        self.addSubview(contentItemsTableView)

        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainImageBottomAnchor?.isActive = false
        mainImageBottomAnchor = mainImageView.bottomAnchor.constraint(equalTo: topDescriptionLabel.topAnchor, constant: (mainImageView.image != nil) ? -EXPLORE_BACKGROUNDIMAGE_TOPMARGIN : 0)
        mainImageBottomAnchor?.isActive = true

        
        topDescriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topDescriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        topDescriptionHeightAnchor?.isActive = false
        topDescriptionHeightAnchor = topDescriptionLabel.heightAnchor.constraint(equalToConstant:  (exploreItem?.topDescription != nil) ? EXPLORE_TOPDESCRIPTION_HEIGHT : 0)
        topDescriptionHeightAnchor?.isActive = true
        topDescriptionLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleLabelHeightAnchor?.isActive = false
        titleLabelHeightAnchor = titleLabel.heightAnchor.constraint(equalToConstant: (exploreItem?.title != nil) ? EXPLORE_TITLE_HEIGHT : 0)
        titleLabelHeightAnchor?.isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: promoMessageLabel.topAnchor).isActive = true
        
        promoMessageLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        promoMessageLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        promoMessageLabelHeightAnchor?.isActive = false
        promoMessageLabelHeightAnchor = promoMessageLabel.heightAnchor.constraint(equalToConstant: (exploreItem?.promoMessage != nil) ? EXPLORE_PROMO_HEIGHT : 0)
        promoMessageLabelHeightAnchor?.isActive = true
        promoMessageLabel.bottomAnchor.constraint(equalTo: bottomDescriptionTextView.topAnchor).isActive = true
        
        bottomDescriptionTextView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomDescriptionTextView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottomDescriptionHeightAnchor?.isActive = false
        bottomDescriptionHeightAnchor = bottomDescriptionTextView.heightAnchor.constraint(equalToConstant: (exploreItem?.bottomDescription != nil) ? EXPLORE_BOTTOMDESCRIPTION_HEIGHT : 0)
        bottomDescriptionHeightAnchor?.isActive = true
        bottomDescriptionTextView.bottomAnchor.constraint(equalTo: contentItemsTableView.topAnchor).isActive = true

        
        contentItemsTableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentItemsTableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        //contentItemsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentItemsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -EXPLORE_BOTTOMMMARGIN_HEIGHT).isActive = true
        contentItemsHeightAnchor?.isActive = false
        if let contentItemCount = exploreItem?.content?.count {
            contentItemsHeightAnchor = contentItemsTableView.heightAnchor.constraint(equalToConstant: CGFloat(contentItemCount) * CONTENT_ITEM_HEIGHT)
        } else {
            contentItemsHeightAnchor = contentItemsTableView.heightAnchor.constraint(equalToConstant: 0)
        }
        contentItemsHeightAnchor?.isActive = true
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setExploreItem(exploreItem: ExploreItem) {
        self.exploreItem = exploreItem
        if let imageRef = exploreItem.backgroundImage {
            if let image = UIImage(named: imageRef){
                mainImageView.image = image

            }
        }
        if let topDescription = exploreItem.topDescription {
            topDescriptionLabel.text = topDescription
        }
        if let title = exploreItem.title {
            titleLabel.text = title
        }
        if let promo = exploreItem.promoMessage {
            promoMessageLabel.text = promo
        }
        if let bottomDescription = exploreItem.bottomDescription {
            let attributedString = bottomDescription.html2Attributed
            if let textString = attributedString?.string {
                if let linkString = bottomDescription.href {
                    let paragraph = NSMutableParagraphStyle()
                    paragraph.alignment = .center
                    let attributedString = NSMutableAttributedString(string: textString,
                                                                     attributes: [.paragraphStyle: paragraph])
                    attributedString.addAttribute(.link, value: linkString, range: NSRange(location: textString.count - 12, length: 12))
                    bottomDescriptionTextView.attributedText = attributedString
                } else {
                    bottomDescriptionTextView.text = textString
                }
            }
            bottomDescriptionTextView.alignTextVerticallyInContainer()

        }
        if exploreItem.content != nil {
            contentItemsTableView.delegate = self
            contentItemsTableView.dataSource = self
        }
        layoutViews()
    }

}


extension ExploreContentCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let contentItemCount = exploreItem?.content?.count {
            return contentItemCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.contentItemsTableView.dequeueReusableCell(withIdentifier: "ContentItemsCell", for: indexPath) as! ContentItemsCell
        cell.isUserInteractionEnabled = true
        if let contentItem = exploreItem?.content?[indexPath.item] {
            cell.setItem(contentItem: contentItem)
            cell.selectionStyle = SelectionStyle.none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let targetUrl = exploreItem?.content?[indexPath.item].target else { return }
        guard let url = URL(string: targetUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CONTENT_ITEM_HEIGHT
    }
    
}
