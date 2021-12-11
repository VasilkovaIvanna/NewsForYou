import XCTest
@testable import NewsForYou

class CheckValidationTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testEmailValidationOnValidEmail() throws {
        let email : String = "example@gmail.com"
        
        XCTAssertTrue(isValidEmail(email))
        
    }
    
    func testEmailValidationFailsWithoutNickname() throws {
        let email : String = "@gmail.com"
        
        XCTAssertFalse(isValidEmail(email))

    }
    
    func testEmailValidationFailsWithoutAddressSign() throws {
        let email : String = "examplegmail.com"
        
        XCTAssertFalse(isValidEmail(email))

    }
    
    func testEmailValidationFailsWithoutDomain() throws {
        let email : String = "example@.com"
        
        XCTAssertFalse(isValidEmail(email))

    }
    
    func testEmailValidationFailsWithoutDot() throws {
        let email : String = "example@gmailcom"
        
        XCTAssertFalse(isValidEmail(email))

    }
    
    func testEmailValidationFailsWithoutSymbolsAfterDot() throws {
        let email : String = "example@gmail."
        
        XCTAssertFalse(isValidEmail(email))

    }
    
    func testEmailValidationFailsWithOneSymbolAfterDot() throws {
        let email : String = "example@gmail.c"
        
        XCTAssertFalse(isValidEmail(email))

    }
    
    func testEmailValidationWithUnderscoreInNickname() throws {
        let email : String = "example_@gmail.com"
        
        XCTAssertTrue(isValidEmail(email))

    }
    
    func testEmailValidationFailsWithUnderscoreInDomain() throws {
        let email : String = "example@gmai_l.com"
        
        XCTAssertFalse(isValidEmail(email))

    }
    
    func testEmailValidationFailsWithDoubleAdressSignes() throws {
        let email : String = "example@@gmail.com"
        
        XCTAssertFalse(isValidEmail(email))

    }
    
}


