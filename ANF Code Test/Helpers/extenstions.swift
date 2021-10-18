//
//  extenstionUIImageView.swift
//  ANF Code Test
//
//  Created by Daniel Espinosa on 10/13/21.
//

import Foundation
import UIKit
import AVKit

extension UIImageView {
        
    var scaledImageHeight: CGFloat {
        if let imageSize = image?.size{
            let screenSize: CGRect = UIScreen.main.bounds
            let multiplier = imageSize.height / imageSize.width
            let scaledImageHeight = screenSize.width * multiplier
            return scaledImageHeight
        } else {
            return 0
        }
    }
}


extension UIImage {
    
    var scaledImageHeight: CGFloat {
        let imageSize = self.size
        let screenSize: CGRect = UIScreen.main.bounds
        let multiplier = imageSize.height / imageSize.width
        let scaledImageHeight = screenSize.width * multiplier
        return scaledImageHeight
    }
}


extension String{
    
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    var href: String? {
        //if let hrefRange = self.range(of: "(?:href\\s*=\\s*\")[^\"]*(?:\")", options: .regularExpression) {
        if let hrefRange = self.range(of: "http:(.[^\"]*)", options: .regularExpression) {
            let href = self[hrefRange]
            return String(href)
        } else {
            return nil
        }
    }

}

extension UIColor {
    
    func hex (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    func anf_tan() -> UIColor {
        return UIColor().hex(hex: "FAF9E5")
    }

    

}

extension UITextView {
    
    func alignTextVerticallyInContainer() {
        var topCorrect = (EXPLORE_BOTTOMDESCRIPTION_HEIGHT - self.contentSize.height * self.zoomScale) / 2
        topCorrect = topCorrect < 0.0 ? 0.0 : topCorrect;
        self.contentInset.top = topCorrect
    }
    
}

