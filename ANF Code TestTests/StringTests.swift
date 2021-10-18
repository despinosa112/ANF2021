//
//  StringTests.swift
//  ANF Code TestTests
//
//  Created by Daniel Espinosa on 10/17/21.
//

import XCTest
@testable import ANF_Code_Test

class StringTests: XCTestCase {
    
    var originalString: String!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        originalString = "*In stores & online. <a href=\\\"http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160602_Tier_Promo_US.html\\\">Exclusions apply. See Details</a>"
    }

    
    func test_expectedStringFromAttributedString(){
        let expectedString = "*In stores & online. Exclusions apply. See Details"
        let actualString = originalString.html2Attributed?.string
        XCTAssertEqual(expectedString, actualString)
    }
    
    //TODO: Write more test cases to force more robust regex rules around getting hrefs from strings
    func test_expectedhrefFromString(){
        let expectedHref = "http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160602_Tier_Promo_US.html\\"
        let actualHref = originalString!.href
        XCTAssertEqual(expectedHref, actualHref)

    }
}
