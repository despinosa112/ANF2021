//
//  ImageViewTests.swift
//  ANF Code TestTests
//
//  Created by Daniel Espinosa on 10/17/21.
//

import XCTest

class ImageTests: XCTestCase {
    
    var image1: UIImage!
    var image2: UIImage!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        image1 =  UIImage(named: "anf-20160527-app-m-shirts.jpg") //Size (1000.0, 559.0)
        image2 =  UIImage(named: "anf-US-20160505-app-w-shorts.jpg") //Size (1000.0, 562.0)
    }
    
    func test_image1Scales(){
        //iphone13 ScreenSize = width: 390, height: 844
        let expectedHeight = CGFloat(218.01) //ExpectedHeight on an iphone13, test will break if run on other devices
        let actualHeight = image1.scaledImageHeight
        //Rounding to 2 decimal points because of natural imprecision with CGFloats
        let isPreciseEnough = (expectedHeight - actualHeight) < CGFloat(0.01) && (expectedHeight - actualHeight) > CGFloat(-0.01)
        XCTAssertTrue(isPreciseEnough)
    }
    
    func test_image2Scales(){
        let expectedHeight = CGFloat(219.18)
        let actualHeight = image2.scaledImageHeight
        let isPreciseEnough = (expectedHeight - actualHeight) < CGFloat(0.01) && (expectedHeight - actualHeight) > CGFloat(-0.01)
        XCTAssertTrue(isPreciseEnough)
    }


}
