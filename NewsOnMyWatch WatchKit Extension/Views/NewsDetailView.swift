//
//  NewsDetailView.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo (NullTwenty) on 16/12/2021.
//

import SwiftUI

struct NewsDetailView: View {
    var news: News
    var body: some View {
        VStack {
            Text(news.headline)
            Text(news.body)
        }
        .padding()
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let news = News(headline: "Headline", body: "Body")
        NewsDetailView(news: news)
    }
}
