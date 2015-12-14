import Alamofire
import JASON

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
        return response(responseSerializer: Request.JASONResponseSerializer(), completionHandler: completionHandler)
    }
}
