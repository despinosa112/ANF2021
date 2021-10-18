//
//  ExploreItemTests.swift
//  ANF Code TestTests
//
//  Created by Daniel Espinosa on 10/17/21.
//

import XCTest
@testable import ANF_Code_Test

class ExploreItemTests: XCTestCase {
    
    var emptyExplporeItem: ExploreItem!
    var exploreItem: ExploreItem!
    var fullExploreItem: ExploreItem!

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let emptyExplporeItem = ExploreItem(title: nil, content: nil, backgroundImage: nil, promoMessage: nil, topDescription: nil, bottomDescription: nil)
        self.emptyExplporeItem = emptyExplporeItem
        
        let exploreItem = ExploreItem(title: "TEST TITLE", content: nil, backgroundImage: nil, promoMessage: "TEST PROMO", topDescription: "TEST TOP DESICRIPTION", bottomDescription: "TEST BOTTOM DESICRIPTION")
        self.exploreItem = exploreItem
        
        let fullExploreItem = ExploreItem(title: "FULL TITLE", content: [ContentItem(target: nil, title: "C1"), ContentItem(target: nil, title: "C2")], backgroundImage: "FULL IMAGE", promoMessage: "FULL PROMO", topDescription: "FULL TOP DESICRIPTION", bottomDescription: "FULL BOTTOM DESICRIPTION")
        self.fullExploreItem = fullExploreItem

    }
    
    func test_emptyExploreItemVariablesAreEmpty() {
        XCTAssertNil(emptyExplporeItem.title)
        XCTAssertNil(emptyExplporeItem.content)
        XCTAssertNil(emptyExplporeItem.backgroundImage)
        XCTAssertNil(emptyExplporeItem.promoMessage)
        XCTAssertNil(emptyExplporeItem.topDescription)
        XCTAssertNil(emptyExplporeItem.bottomDescription)
    }
    
    func test_emptyExploreItemheightIsEmpty() {
        let actualHeight = emptyExplporeItem.height
        let expectedHeight = CGFloat(0)
        XCTAssertEqual(expectedHeight, actualHeight, "empty explore item has unexepected height")
    }
    
    func test_exploreItemsValues(){
        let actualTitle = exploreItem.title
        let actualContent = exploreItem.content
        let actualBackgroundImage = exploreItem.backgroundImage
        let actualPromoMessage = exploreItem.promoMessage
        let actualTopDescription = exploreItem.topDescription
        let actualBottomDescription = exploreItem.bottomDescription
        
        let expectedTitle = "TEST TITLE"
        let expectedContent: [ContentItem]? = nil
        let expectedBackgroundImage: String? = nil
        let expectedPromoMessage = "TEST PROMO"
        let expectedTopDescription = "TEST TOP DESICRIPTION"
        let expectedBottomDescription = "TEST BOTTOM DESICRIPTION"
        
        XCTAssertEqual(actualTitle, expectedTitle, "title is incorrect")
        XCTAssertEqual(actualContent, expectedContent, "content is incorrect")
        XCTAssertEqual(actualBackgroundImage, expectedBackgroundImage, "backgroundImage is incorrect")
        XCTAssertEqual(actualPromoMessage, expectedPromoMessage, "promoMessage is incorrect")
        XCTAssertEqual(actualTopDescription, expectedTopDescription, "top description is incorrect")
        XCTAssertEqual(actualBottomDescription, expectedBottomDescription, "bottom description is incorrect")
    }
    
    func test_exploreItemHeight() {
        let expectedHeight: CGFloat = 143
        let actualHeight = exploreItem.height
        XCTAssertEqual(expectedHeight, actualHeight, "exploreItem height is incorrect")
    }
    
    
    func test_fullExploreItemsValues(){
        let actualTitle = fullExploreItem.title
        let actualContent = fullExploreItem.content
        let actualBackgroundImage = fullExploreItem.backgroundImage
        let actualPromoMessage = fullExploreItem.promoMessage
        let actualTopDescription = fullExploreItem.topDescription
        let actualBottomDescription = fullExploreItem.bottomDescription
        
        let expectedTitle = "FULL TITLE"
        let expectedContent: [ContentItem]? = [ContentItem(target: nil, title: "C1"), ContentItem(target: nil, title: "C2")]
        let expectedBackgroundImage: String? = "FULL IMAGE"
        let expectedPromoMessage = "FULL PROMO"
        let expectedTopDescription = "FULL TOP DESICRIPTION"
        let expectedBottomDescription = "FULL BOTTOM DESICRIPTION"
        
        XCTAssertEqual(actualTitle, expectedTitle, "title is incorrect")
        XCTAssertEqual(actualContent, expectedContent, "content is incorrect")
        XCTAssertEqual(actualBackgroundImage, expectedBackgroundImage, "backgroundImage is incorrect")
        XCTAssertEqual(actualPromoMessage, expectedPromoMessage, "promoMessage is incorrect")
        XCTAssertEqual(actualTopDescription, expectedTopDescription, "top description is incorrect")
        XCTAssertEqual(actualBottomDescription, expectedBottomDescription, "bottom description is incorrect")
    }
    
    func test_fullExploreItemHeight() {
        let expectedHeight: CGFloat = 263
        let actualHeight = fullExploreItem.height
        XCTAssertEqual(expectedHeight, actualHeight, "full item height is incorrect")
    }

}
