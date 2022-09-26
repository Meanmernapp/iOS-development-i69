//
//  GraphQLClient.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import Apollo
import Combine

class GraphQLClient 
{
    private lazy var store = ApolloStore()
    
    static let shared = GraphQLClient()
    /// A web socket transport to use for subscriptions
    private lazy var webSocketTransport: WebSocketTransport = {
      let url = URL(string: "wss://admin.chatadmin-mod.click/ws/graphql")!
      let webSocketClient = WebSocket(url: url, protocol: .graphql_transport_ws)
      return WebSocketTransport(websocket: webSocketClient)
    }()
    
    /// An HTTP transport to use for queries and mutations
    private lazy var normalTransport: RequestChainNetworkTransport = {
      let url = URL(string: "https://api.chatadmin-mod.click")!
        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["Authorization": "Token \(SignUpHelper.shared.token)"]
//        let authPayloads = ["Authorization": "Token 0d0a6438564ec9525a5673eb270150d27703c613"]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
      return RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
    }()

    /// A split network transport to allow the use of both of the above
    /// transports through a single `NetworkTransport` instance.
    private lazy var splitNetworkTransport = SplitNetworkTransport(
      uploadingNetworkTransport: self.normalTransport,
      webSocketNetworkTransport: self.webSocketTransport
    )

    /// Create a client using the `SplitNetworkTransport`.
    private(set) lazy var client = ApolloClient(networkTransport: self.splitNetworkTransport, store: self.store)

    /// A common store to use for `normalTransport` and `client`.
    
    private(set) lazy var apollo: ApolloClient = {
        
        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["Authorization": "Token \(SignUpHelper.shared.token)"]
//        let authPayloads = ["Authorization": "Token 0d0a6438564ec9525a5673eb270150d27703c613"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        //https://api.chatadmin-mod.click
//        let url = URL(string: "http://95.216.208.1:8000")!
        let url = URL(string: "https://api.chatadmin-mod.click")!
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
    
    
    private(set) lazy var uploadClient: ApolloClient = {
        
        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["Authorization": "Token \(SignUpHelper.shared.token)"]
//        let authPayloads = ["Authorization": "Token 0d0a6438564ec9525a5673eb270150d27703c613"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider2(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        
        //https://api.chatadmin-mod.click
//        let url = URL(string: "http://95.216.208.1:8000")!
        let url = URL(string: "https://api.chatadmin-mod.click")!
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
    
    func upload<Mutation: GraphQLMutation>(mutation: Mutation,file : GraphQLFile,completion: @escaping (GraphQLResult<Mutation.Data>? , Error?)  -> Void)
    {
        
        
        
        
        uploadClient.upload(operation: mutation, files: [file]){result in
            switch result
            {
            case .success(let data) :
                if let errors = data.errors
                {
                    let error = NSError(domain: "", code: 4022, userInfo: ErrorHandler(errors: errors).userInfo)
                    completion(nil,error)
                }
                else{
                    completion(data,nil)
                }
                
            case .failure(let error) :
                
                completion(nil,error)
            }
        }
    }
    public func performMutation<Mutation: GraphQLMutation>(mutation: Mutation,
                                                   completion: @escaping (GraphQLResult<Mutation.Data>? , Error?)  -> Void) {
        
        apollo.perform(mutation: mutation){result in
            switch result
            {
            case .success(let data) :
                if let errors = data.errors
                {
                    let error = NSError(domain: "", code: 4022, userInfo: ErrorHandler(errors: errors).userInfo)
                    completion(nil,error)
                }
                else{
                    completion(data,nil)
                }
                
            case .failure(let error) :
                print(error.localizedDescription)
                completion(nil,error)
            }
        }
    }
    
    public func fetchQuery<Query: GraphQLQuery>(query: Query,completion: @escaping (Query.Data? , Error?)  -> Void)
    {
        
        apollo.fetch(query: query){ result in
            switch result
            {
            case .success(let data):
                if let errors = data.errors
                {
                    let error = NSError(domain: "", code: 4022, userInfo: ErrorHandler(errors: errors).userInfo)
                    completion(nil,error)
                }
                else{
                    completion(data.data,nil)
                }
            case .failure(let error):
                completion(nil,error)
            }
            
        }
    }
    public func subscribe<Subscription: GraphQLSubscription>(subscribe: Subscription,completion: @escaping (Subscription.Data? , Error?)  -> Void)
    {
        client.subscribe(subscription: subscribe) { result in
                switch result
                {
                case .success(let data):
                    if let errors = data.errors
                    {
                        let error = NSError(domain: "", code: 4022, userInfo: ErrorHandler(errors: errors).userInfo)
                        completion(nil,error)
                    }
                    else{
                        completion(data.data,nil)
                    }
                case .failure(let error):
                    completion(nil,error)
                }
            }
    }
}


class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            request.addHeader(name: "Authorization", value: "Token \(SignUpHelper.shared.token)")
//            request.addHeader(name: "Authorization", value: "Token 0d0a6438564ec9525a5673eb270150d27703c613")
//            request.addHeader(name: "Content-Type", value: "Content-Disposition: form-data")
        
        print("request :\(request)")
        print("response :\(String(describing: response))")
        
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}

class NetworkInterceptorProvider2: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor2(), at: 0)
        return interceptors
    }
}

class CustomInterceptor2: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            request.addHeader(name: "Authorization", value: "Token \(SignUpHelper.shared.token)")
//            request.addHeader(name: "Authorization", value: "Token 0d0a6438564ec9525a5673eb270150d27703c613")
            request.addHeader(name: "Content-Type", value: "Content-Disposition: form-data")
        
        print("request :\(request)")
        print("response :\(String(describing: response))")
        
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
