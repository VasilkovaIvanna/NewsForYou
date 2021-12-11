import XCTest
@testable import NewsForYou

class SearchTests: XCTestCase {
    
    let nsm = NewsViewModel()
    
    override func setUpWithError() throws {
        
        nsm.storedArticles = [
            Articles(title: "Volkswagen, Bosch to cooperate on automotive software: Report"),
            Articles(title: "Canaccord Genuity Group CEO Daniel Daviau on financial uncertainty, environmental sustainability and the Omicron variant"),
            Articles(title: "Cryptocurrency was the most popular conversation on Reddit in 2021"),
            Articles(title: "Rift between senator and son shows the challenge of taxing the ultrarich"),
            Articles(title: "Elon Musk’s latest innovation: Troll philanthropy")]
        
    }
    
    override func tearDownWithError() throws {}
    
    func testEmptySearch() throws {
        
        nsm.searchText = ""
        
        XCTAssertEqual(nsm.storedArticles.count, nsm.filterArticles().count)
        
        XCTAssertEqual(nsm.storedArticles, nsm.filterArticles())
    }
    
    func testLowerCaseSearch() throws {
        
        nsm.searchText = "cryptocurrency"
        
        var counter = 0
        
        for article in nsm.storedArticles {
            if article.title.lowercased().contains(nsm.searchText) {
                counter += 1
            }
        }
        
        let filteredArticles = nsm.filterArticles()
        
        XCTAssertEqual(counter, filteredArticles.count)
        
        for article in filteredArticles {
            
            XCTAssertTrue(article.title.lowercased().contains(nsm.searchText))
            
        }
    }
    
    func testUpperCaseSearch() throws {
        
        nsm.searchText = "CANACCORD"
        
        var counter = 0
        
        for article in nsm.storedArticles {
            if article.title.uppercased().contains(nsm.searchText) {
                counter += 1
            }
        }
        
        let filteredArticles = nsm.filterArticles()
        
        XCTAssertEqual(counter, filteredArticles.count)
        
        for article in filteredArticles {
            
            XCTAssertTrue(article.title.uppercased().contains(nsm.searchText))
            
        }
    }
    
    func testContainsDigitsCaseSearch() throws {
        
        nsm.searchText = "Reddit in 2021"
        
        var counter = 0
        
        for article in nsm.storedArticles {
            if article.title.contains(nsm.searchText) {
                counter += 1
            }
        }
        
        let filteredArticles = nsm.filterArticles()
        
        XCTAssertEqual(counter, filteredArticles.count)
        
        for article in filteredArticles {
            
            XCTAssertTrue(article.title.contains(nsm.searchText))
            
        }
    }
    
    func testFilterReturnsMultipleValuesSearch() throws {
        
        nsm.searchText = "the"
        
        var counter = 0
        
        for article in nsm.storedArticles {
            if article.title.contains(nsm.searchText) {
                counter += 1
            }
        }
        
        let filteredArticles = nsm.filterArticles()
        
        XCTAssertTrue(filteredArticles.count > 1)
                
        for article in filteredArticles {
            
            XCTAssertTrue(article.title.contains(nsm.searchText))
            
        }
    }
}
