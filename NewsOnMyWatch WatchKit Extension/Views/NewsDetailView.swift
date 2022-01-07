//
//  NewsDetailView.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo (NullTwenty) on 16/12/2021.
//

import SwiftUI

struct NewsDetailView: View {
    var news: ArticleCodable
    var body: some View {
        VStack {
            Text(news.title)
            Text(news.articleDescription!)
        }
        .padding()
    }
}

//struct NewsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let news = News(author: "", title: "Test title", newsDescription: "Test description", url: "", source: "", image: "", category: "", language: "", country: "", publishedAt: Date())
//        NewsDetailView(news: news)
//    }
//}
