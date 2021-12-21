//
//  NewsListView.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo (NullTwenty) on 16/12/2021.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var newsViewModel: NewsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(newsViewModel.newsList) { pieceOfNews in
                    NewsListRow(pieceOfNews: pieceOfNews)
                        .padding()
                }
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(newsViewModel: NewsViewModel())
    }
}
