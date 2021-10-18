//
//  ContentItemsTest.swift
//  ANF Code TestTests
//
//  Created by Daniel Espinosa on 10/17/21.
//

import XCTest
@testable import ANF_Code_Test

class ContentItemsTest: XCTestCase {
    
    var emptyContentItem: ContentItem!
    var contentItem: ContentItem!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let emptyContentItem = ContentItem(target: nil, title: nil)
        self.emptyContentItem = emptyContentItem
        
        let contentItem = ContentItem(target: "url target", title: "title")
        self.contentItem = contentItem
    }
    
    func test_emptyContentItemIsEmpty(){
        XCTAssertNil(emptyContentItem.target)
        XCTAssertNil(emptyContentItem.title)
    }
    
    func test_contentItemValues(){
        let expectedTarget = "url target"
        let expectedTitle = "title"
        
        let actualTarget = contentItem.target
        let actualTitle = contentItem.title
        
        XCTAssertEqual(expectedTarget, actualTarget, "target is incorrect")
        XCTAssertEqual(expectedTitle, actualTitle, "title is incorrect")

    }


}
