//
//  File.swift
//  AuthTutorial
//
//  Created by yuz_chen on 11/4/23.
//

import Foundation

/// Swiftxios Tools
/// for more less code to fetch the api call
/// version 0.1.0 alpha
final class Swiftxios: ObservableObject {
    static var swiftxios: Swiftxios = Swiftxios()
    
    private var httpSession: URLSession
    
    private init() {
        self.httpSession = URLSession.shared
    }
    
//    init(config: URLSession) {
//        self.httpSession = config
//
//    }
    
    enum FetchError: Error {
        case invalidURL, invalidResponse, invalidData, invalidObjectConvert
    }
    
    private enum RequestMethod: String {
        case POST = "POST"
        case GET = "GET"
    }
    
    private func makeRequestObj(_ url: URL, _ method: RequestMethod, _ body: [String : Any]? = nil, _ config: [String : String]? = nil) -> URLRequest {
        var request: URLRequest = URLRequest(url: url)
        
        // request object with post reuqest method
        request.httpMethod = method.rawValue
        
        // try to set body object
        if let body = body {
            let bodyData = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = bodyData
        }
        
        //try to set additional config that invoker require
        if let config = config {
            for (key, value) in config {
                request.setValue(key, forHTTPHeaderField: value)
            }
        }
        
        return request
    }
    
    private func makeFetch(request: URLRequest) async throws -> Data {
        let (data, response) = try await self.httpSession.data(for: request)
        
        guard
            let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            print(response)
            throw Swiftxios.FetchError.invalidResponse
        }
        
        print("makeFetch -> ok")
        return data
    }
    
    /// post method to fetch a post request
    /// - Parameters:
    ///     - url: String url to farder request
    ///     - body : Dictionary for store the body data
    ///     - config: adddtion header config that need to customize
    /// - Throws: There is 4 type of exception will the throw,
    ///           invalidURL, invalidResponse, invalidData, invalidObjectConvert
    /// - Returns: optional object T
    ///
    /// Swiftxios to fetch the given endpoint ulr make a post request, then return the result data object
    func post<T: Codable>(_ urlEndpoint: String, _ body: [String : Any]? = nil, _ config: [String : String]? = nil) async throws -> T? {
        print(urlEndpoint)
        // prepare the url object to init request object
        guard let url: URL = URL(string: urlEndpoint) else {
            throw Swiftxios.FetchError.invalidURL;
        };
        
        let request: URLRequest = makeRequestObj(url, RequestMethod.POST, body, config)
        
        // featch the url request
        let data: Data = try await makeFetch(request: request)

        do {
            print(data.description)
            return try self.swiftxiosJSONDecoder(data: data)
        } catch {
            throw Swiftxios.FetchError.invalidData;
        }
    }
    
    /// get method to fetch a get request
    /// - Parameters:
    ///     - url: String url to farder request
    ///     - config: adddtion header config that need to customize
    /// - Throws: There is 4 type of exception will the throw,
    ///           invalidURL, invalidResponse, invalidData, invalidObjectConvert
    /// - Returns: optional object T
    ///
    /// Swiftxios to fetch the given endpoint ulr make a get request, then return the result data object
    func get<T: Codable>(_ urlEndpoint: String, _ config: [String : String]? = nil) async throws -> T? {
        guard let url: URL = URL(string: urlEndpoint) else {
            throw Swiftxios.FetchError.invalidURL;
        };
        
        let request: URLRequest = makeRequestObj(url, RequestMethod.GET, config)
        
        let data: Data = try await makeFetch(request: request)
        
        do {
            print(data.description)
            return try self.swiftxiosJSONDecoder(data: data)
        } catch {
            throw Swiftxios.FetchError.invalidData;
        }
    }
    
    
}