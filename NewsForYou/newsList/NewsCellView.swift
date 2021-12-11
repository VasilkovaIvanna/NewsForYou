import Foundation
import SwiftUI


struct NewsCell: View {
    
    func ImageCell() -> UIImage{
        if let urlString = news.urlToImage {
            let url = URL(string: urlString)
            do {
                let data = try Data(contentsOf: url!)
                return UIImage(data: data) ?? UIImage(named: "girls")!
            } catch {
                return UIImage(named: "girls")!
            }
            
        }
        return UIImage(named: "girls")!
    }
    
    @State var news : Articles
    
    var body: some View {
        HStack(spacing: 0){
            Image(uiImage: ImageCell())
                .resizable()
                .scaledToFill()
                .frame(width: 148, height: 148)
                .padding(0)
                .cornerRadius(12)
            
//            Text(news.title)
            ExpandableText(news.title, lineLimit: 5)
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                .padding(.top, 20)
                .padding(.leading)
                .padding(.trailing)
                .lineLimit(4)
        }
        .frame(width: 320, alignment: .top)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}
