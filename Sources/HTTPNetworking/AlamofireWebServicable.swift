//
//  AlamofireWebServicable.swift
//  HTTPNetworking
//
//  Created by Boyan Yankov on W08 25/Feb/2018 Sun.
//

import Foundation
import Alamofire

public protocol AlamofireWebServicable: WebServicable {
    
    // configuring Request
    /// httpVerb method
    func httpVerb() -> Alamofire.HTTPMethod
    
    /// Request parameters encoding
    func requestParametersEncoding() -> Alamofire.ParameterEncoding
    
    /// Reference to request object
    var alamofireRequest: Alamofire.Request? { get }
}

