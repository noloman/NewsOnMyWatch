//
//  NewsListView.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo (NullTwenty) on 16/12/2021.
//

import SwiftUI

struct NewsListView: View {
    @State var news: [News]
    
    init() {
        var stateNews = [News]()
        for i in 1..<100 {
            stateNews.append(News(headline: "Headline #\(i)", body: "Body \(i)"))
        }
        _news = State(wrappedValue: stateNews)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(news) { (pieceOfNews: News) in
                    NewsListRow(pieceOfNews: pieceOfNews)
                        .padding()
                }
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

struct NewsListRow: View {
    @State var pieceOfNews: News
    var body: some View {
        NavigationLink {
            NewsDetailView(news: pieceOfNews)
        } label: {
            HStack {
                Image(systemName: "newspaper")
                VStack {
                    Text(pieceOfNews.headline)
                        .font(.subheadline)
                        .padding()
                    Text(pieceOfNews.body)
                        .font(.body)
                        .padding()
                        .lineLimit(2)
                }
            }
        }
    }
}
