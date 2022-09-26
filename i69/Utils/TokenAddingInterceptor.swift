//
//  TokenAddingInterceptor.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//
import Foundation
import Apollo

class TokenAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
    
        response: HTTPResponse<Operation>?,
    
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
    }
}
