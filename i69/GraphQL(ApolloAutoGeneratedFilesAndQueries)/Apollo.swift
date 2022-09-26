/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
/*
 # Apollo to generate schema file
 
 SCRIPT_PATH="${PODS_ROOT}/Apollo/scripts"
 cd "${SRCROOT}/${TARGET_NAME}"
 "${SCRIPT_PATH}"/run-bundled-codegen.sh schema:download --endpoint=http://95.216.208.1:8000 schema.json
*/

/*# Apollo query running
 # Don't run this during index builds
 if [ $ACTION = "indexbuild" ]; then exit 0; fi

 SCRIPT_PATH="${PODS_ROOT}/Apollo/scripts"
 cd "${SRCROOT}/${TARGET_NAME}"
 "${SCRIPT_PATH}"/run-bundled-codegen.sh codegen:generate --target=swift --includes=./**/qDefaultPicker.graphql --localSchemaFile="schema.json" Picker.swift
*/
import Foundation
import Apollo

class Apollo {
  // 1
  static let shared = Apollo()
  // 2
  let client: ApolloClient
  // 3
  init() {
    // swiftlint:disable:next force_unwrapping
    client = ApolloClient(url: URL(string: "https://api.chatadmin-mod.click")!)
  }
    
  /// A web socket transport to use for subscriptions
  private lazy var webSocketTransport: WebSocketTransport = {
    let url = URL(string: "wss://api.chatadmin-mod.click/ws/graphql")!
      let authPayload = ["Authorization": "Token \(SignUpHelper.shared.token)"]
//      let authPayloads = ["Authorization": "Token 0d0a6438564ec9525a5673eb270150d27703c613"]
    let webSocketClient = WebSocket(url: url, protocol: .graphql_ws)
    return WebSocketTransport(websocket: webSocketClient,connectingPayload: authPayload)
  }()
  
  /// An HTTP transport to use for queries and mutations
  private lazy var normalTransport: RequestChainNetworkTransport = {
    let url = URL(string: "https://api.chatadmin-mod.click")!
      let cache = InMemoryNormalizedCache()
      let store1 = ApolloStore(cache: cache)
//      let authPayloads = ["Authorization": "Token \(SignUpHelper.shared.token)"]
      let authPayloads = ["Authorization": "Token 0d0a6438564ec9525a5673eb270150d27703c613"]
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
  private(set) lazy var client2 = ApolloClient(networkTransport: self.splitNetworkTransport, store: self.store1)

  /// A common store to use for `normalTransport` and `client`.
//  private lazy var store = ApolloStore()
    private lazy var cache = InMemoryNormalizedCache()
    private lazy var store1 = ApolloStore(cache: cache)
}
