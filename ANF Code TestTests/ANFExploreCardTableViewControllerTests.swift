//
//  ANF_Code_TestTests.swift
//  ANF Code TestTests
//


import XCTest
@testable import ANF_Code_Test

class ANFExploreCardTableViewControllerTests: XCTestCase {

    var testInstance: ANFExploreCardTableViewController!
    
    override func setUp() {
        testInstance = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as? ANFExploreCardTableViewController
    }
    
    func test_numberOfSections_ShouldBeOne() {
        let numberOfSections = testInstance.numberOfSections(in: testInstance.tableView)
        XCTAssert(numberOfSections == 1, "table view should have 1 section")
    }
    
    func test_numberOfRows_ShouldBeTen() {
        let numberOfRows = testInstance.tableView(testInstance.tableView, numberOfRowsInSection: 0)
        XCTAssert(numberOfRows == 10, "table view should have 10 cells")
    }
    
    func test_cellForRowAtIndexPath_titleText_shouldNotBeBlack() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
        let title = firstCell.titleLabel
        XCTAssert(title.text?.count ?? 0 > 0, "title should not be blank")
    }
    
    func test_cellForRowAtIndexPath_titleText_isExpected() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
        let expectedTitle = "TOPS STARTING AT $12"
        let actualTitle = firstCell.titleLabel.text
        XCTAssertEqual(expectedTitle, actualTitle, "title does not match")
    }
    
        func test_cellForRowAtIndexPath_Image_shouldNotBeNil() {
            let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
            let imageView = firstCell.mainImageView
            XCTAssert(imageView.image != nil, "image view image should not be nil")
        }
    
    func test_cellForRowAtIndexPath_expectedSecondImage() {
        let secondCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! ExploreContentCell
        let expectedSecondImage = UIImage(named: "anf-US-20160601-app-women-dresses.jpg")
        let actualSecondImage = secondCell.mainImageView.image
        XCTAssertEqual(expectedSecondImage, actualSecondImage!, "second image is incorrect")
    }
    
    func test_firstCellHasTwoContentItems() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
        let expectedCount = 2
        let actualCount = firstCell.exploreItem?.content?.count
        XCTAssertEqual(expectedCount, actualCount, "expected count is not 2")
    }
    
    func test_secondCellHasOneContentItem() {
        let secondCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! ExploreContentCell
        let expectedCount = 1
        let actualCount = secondCell.exploreItem?.content?.count
        XCTAssertEqual(expectedCount, actualCount, "expected count is not 1")
    }
    
    func test_firstCellContentItemTableViewShouldNotBeNull() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
        let contentTableView = firstCell.contentItemsTableView
        XCTAssert(contentTableView != nil, "contentTableView should not be nil")
    }
    
    func test_firstCellPromoLabelTextShouldNotBeNull() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
        let promoLabelText = firstCell.promoMessageLabel.text
        XCTAssert(promoLabelText != nil, "promoLabel Text should not be nil")
    }
    
    func test_secondCellPromoLabelTextShouldBeNull() {
        let secondCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! ExploreContentCell
        let promoLabelText = secondCell.promoMessageLabel.text
        XCTAssert(promoLabelText == nil, "promoLabel Text should be nil")
    }
    
    //topDescription
    func test_firstCellTopDescriptionLabelShouldNotBeNull() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
        let topDescriptionLabel = firstCell.topDescriptionLabel
        XCTAssert(topDescriptionLabel != nil, "topDescriptionLabel should not be nil")
    }
    
    func test_firstCellTopDescriptionText(){
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
        let expectedText = "A&F ESSENTIALS"
        let actualText = firstCell.topDescriptionLabel.text
        XCTAssertEqual(expectedText, actualText, "unxpected first cell top descriptionText")
    }
    
    func test_thirdCellTopDescriptionTextShouldbeNull(){
        let thirdCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 2, section: 0)) as! ExploreContentCell
        let actualText = thirdCell.topDescriptionLabel.text
        XCTAssertNil(actualText, "Third cell top description text should be nil")
    }
    
    func test_firstCellBottomDescriptionText(){
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentCell
        let expectedText = "*In stores & online. Exclusions apply. See Details"
        let actualText = firstCell.bottomDescriptionTextView.text
        XCTAssertEqual(expectedText, actualText, "unxpected first cell bottom descriptionText")
    }
    
    func test_SecondCellBottomDescriptionText(){
        let secondCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! ExploreContentCell
        let expectedText = ""
        let actualText = secondCell.bottomDescriptionTextView.text
        XCTAssertEqual(expectedText, actualText, "unxpected first cell bottom descriptionText")
    }

}
