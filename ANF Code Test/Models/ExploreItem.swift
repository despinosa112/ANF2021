//
//  ExploreItem.swift
//  ANF Code Test
//
//  Created by Daniel Espinosa on 10/12/21.
//

import Foundation
import UIKit

struct ExploreItem: Decodable {
    let title: String?
    let content: [ContentItem]?
    let backgroundImage: String?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
    
    var height: CGFloat {
        var total: CGFloat = 0
        if let backgroundImage = backgroundImage {
            if let image = UIImage(named: backgroundImage) {
                total += image.scaledImageHeight + EXPLORE_BACKGROUNDIMAGE_TOPMARGIN
            }
        }
        if topDescription != nil {
            total += EXPLORE_TOPDESCRIPTION_HEIGHT
        }
        if title != nil {
            total += EXPLORE_TITLE_HEIGHT
        }
        if promoMessage != nil {
            total += EXPLORE_PROMO_HEIGHT
        }
        if bottomDescription != nil {
            total += EXPLORE_BOTTOMDESCRIPTION_HEIGHT
        }
        if let content = content {
            let contentHeight = CGFloat(content.count) * CONTENT_ITEM_HEIGHT
            total += contentHeight
        }
        if (total > 0){
            total += EXPLORE_BOTTOMMMARGIN_HEIGHT
        }
        return total
    }
}

