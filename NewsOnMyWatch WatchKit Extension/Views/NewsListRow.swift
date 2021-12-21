//
//  NewsListRow.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by WF06FC on 21/12/2021.
//

import SwiftUI

struct NewsListRow: View {
    @State var pieceOfNews: News
    var body: some View {
        NavigationLink {
            NewsDetailView(news: pieceOfNews)
        } label: {
            HStack {
                if let image = pieceOfNews.image {
                    AsyncImage(url: URL(string: image))
                }
                VStack {
                    Text(pieceOfNews.title)
                        .font(.subheadline)
                        .padding()
                    Spacer()
                    Text(pieceOfNews.newsDescription)
                        .font(.body)
                        .padding()
                }
            }
        }
    }
}

struct NewsListRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsListRow(pieceOfNews: News(author: "", title: "", newsDescription: "", url: "", source: "", image: "", category: .general, language: .spanish, country: .spain, publishedAt: Date()))
    }
}
