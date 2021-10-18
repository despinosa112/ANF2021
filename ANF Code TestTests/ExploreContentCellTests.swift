//
//  ExploreContentCellTests.swift
//  ANF Code TestTests
//
//  Created by Daniel Espinosa on 10/17/21.
//

import XCTest
@testable import ANF_Code_Test

class ExploreContentCellTests: XCTestCase {
    
    var exploreCell: ExploreContentCell!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let testInstance = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as! ANFExploreCardTableViewController
        exploreCell = (testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell)
    }

    
    
    func test_subViewAreLaidOut(){
        let mainImageView = exploreCell.mainImageView
        let topDescriptionLabel = exploreCell.topDescriptionLabel
        let titleLabel = exploreCell.titleLabel
        let promoMessageLabel = exploreCell.promoMessageLabel
        let bottomDescriptionTextView = exploreCell.bottomDescriptionTextView
        let contentItemsTableView = exploreCell.contentItemsTableView
        
        let containsMainImageView = exploreCell.subviews.contains(mainImageView)
        let containsTopDescriptionImageView = exploreCell.subviews.contains(topDescriptionLabel)
        let containsTitleView = exploreCell.subviews.contains(titleLabel)
        let containsPromoMessageView = exploreCell.subviews.contains(promoMessageLabel)
        let containsBottomDescriptionTextView = exploreCell.subviews.contains(bottomDescriptionTextView)
        let containsContentItemsTableView = exploreCell.subviews.contains(contentItemsTableView)


        XCTAssertTrue(containsMainImageView)
        XCTAssertTrue(containsTopDescriptionImageView)
        XCTAssertTrue(containsTitleView)
        XCTAssertTrue(containsPromoMessageView)
        XCTAssertTrue(containsBottomDescriptionTextView)
        XCTAssertTrue(containsContentItemsTableView)
    }
    
    func test_setsExploreItem() {
        XCTAssertNotNil(exploreCell.exploreItem)
    }

}
