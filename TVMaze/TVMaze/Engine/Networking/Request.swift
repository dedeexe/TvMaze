import DDXNetwork
import Foundation

struct Request: RequestModel {
    var url: String
    var method: DDXNetwork.HttpMethod
    var body: DDXNetwork.HttpBody?
    var headers: DDXNetwork.HttpHeaders
    var timeout: TimeInterval = 30.0
}
