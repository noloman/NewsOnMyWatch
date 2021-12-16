//
//  News.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo (NullTwenty) on 16/12/2021.
//

import Foundation

struct News: Identifiable, Equatable {
    let id: UUID = UUID()
    let headline: String
    let body: String
}
