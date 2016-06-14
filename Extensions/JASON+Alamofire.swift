//
// JASON+Alamofire.swift
//
// Copyright (c) 2015-2016 Damien (http://delba.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import JASON
import Alamofire

extension Alamofire.Request {
    /**
     Creates a response serializer that returns a JASON.JSON object constructed from the response data.
     
     - returns: A JASON.JSON object response serializer.
     */
    static public func JASONResponseSerializer() -> Alamofire.ResponseSerializer<JASON.JSON, NSError> {
        return Alamofire.ResponseSerializer { _, _, data, error in
            guard error == nil else { return .Failure(error!) }
            
            return .Success(JASON.JSON(data))
        }
    }
    
    /**
     Adds a handler to be called once the request has finished.
     
     - parameter completionHandler: A closure to be executed once the request has finished.
     
     - returns: The request.
     */
    public func responseJASON(completionHandler: Alamofire.Response<JASON.JSON, NSError> -> Void) -> Self {
        return response(responseSerializer: Alamofire.Request.JASONResponseSerializer(), completionHandler: completionHandler)
    }
}
