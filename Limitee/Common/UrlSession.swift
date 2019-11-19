//
//  UrlSession.swift
//  OnItsWay
//
//  Created by User on 14/07/16.
//  Copyright © 2016 User. All rights reserved.
//

import Foundation

public extension URLSession {
    
    /// Return data from synchronous URL request
    public static func requestSynchronousData(_ request: NSURLRequest) -> NSData? {
        var data: NSData? = nil
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            taskData, _, error -> () in
            data = taskData! as NSData
            if data == nil, let error = error {print(error)}
            semaphore.signal();
        })
        task.resume()
semaphore.wait(timeout: .distantFuture)
        return data
    }
    
    /// Return data synchronous from specified endpoint
    public static func requestSynchronousDataWithURLString(_ requestString: String) -> NSData? {
        guard let url = NSURL(string:requestString) else {return nil}
        let request = NSURLRequest(url: url as URL)
        return URLSession.requestSynchronousData(request)
    }
    
    /// Return JSON synchronous from URL request
    public static func requestSynchronousJSON(_ request: NSURLRequest) -> AnyObject? {
        guard let data = URLSession.requestSynchronousData(request) else {return nil}
        return try? JSONSerialization.jsonObject(with: data as Data, options: []) as AnyObject
    }
    
    /// Return JSON synchronous from specified endpoint
    public static func requestSynchronousJSONWithURLString(_ requestString: String) -> AnyObject? {
        guard let url = NSURL(string: requestString) else {return nil}
        let request = NSMutableURLRequest(url:url as URL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return URLSession.requestSynchronousJSON(request)
    }
}
