//
//  NewsListRow.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo Parejo (NullTwenty) on 21/12/2021.
//

import SwiftUI

struct NewsListRow: View {
    @State var pieceOfNews: ArticleCodable
    var body: some View {
        NavigationLink {
            NewsDetailView(news: pieceOfNews)
        } label: {
            HStack {
                if let image = pieceOfNews.urlToImage {
                    AsyncImage(url: URL(string: image))
                }
                VStack {
                    Text(pieceOfNews.title)
                        .font(.subheadline)
                        .padding()
                    Spacer()
                    Text(pieceOfNews.articleDescription!)
                        .font(.body)
                        .padding()
                }
            }
        }
    }
}

struct NewsListRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsListRow(pieceOfNews: ArticleCodable(source: .init(id: "1", name: "Source name"), author: "Author", title: "Title", articleDescription: "Description", url: "url", urlToImage: nil, publishedAt: Date.now, content: "Article content"))
    }
}
