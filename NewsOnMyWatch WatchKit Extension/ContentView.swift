//
//  ContentView.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo (NullTwenty) on 16/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var newsViewModel = NewsViewModel()
    var body: some View {
        NewsListView(newsViewModel: newsViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
