import Foundation
import SwiftUI

struct NewsList : View {
    
    var newsList : [Articles]
    
    var body: some View {
        VStack{
            ScrollView(.vertical) {
                VStack {
                    ForEach(newsList, id: \.title) { news in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            NewsCell(news: news)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}
