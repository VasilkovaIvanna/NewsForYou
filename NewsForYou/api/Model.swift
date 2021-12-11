import Foundation

struct NewsResponse : Decodable {
    var status: String?
    var totalResults : Int?
    var articles : [Articles]?
}

struct Articles : Decodable, Equatable {
    var source: Source?
    var author: String?
    var title: String
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source : Decodable, Equatable{
    var id: String?
    var name: String?
}
