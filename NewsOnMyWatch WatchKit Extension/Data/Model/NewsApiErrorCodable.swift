//
//  NewsApiError.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by WF06FC on 20/12/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newsAPIError = try? newJSONDecoder().decode(NewsAPIError.self, from: jsonData)

import Foundation

// MARK: - NewsAPIError
struct NewsApiError: Codable {
    let error: Error
}

// MARK: - Error
struct Error: Codable {
    let code, message: String
    let context: Context
}

// MARK: - Context
struct Context: Codable {
    let date: [ContextError]
}

enum ContextError: String, Codable {
case invalid_access_key,
    missing_access_key,
    inactive_user,
    https_access_restricted,
    function_access_restricted,
    invalid_api_function,
    not_found = "404_not_found",
    usage_limit_reached,
    rate_limit_reached,
    internal_error
}
