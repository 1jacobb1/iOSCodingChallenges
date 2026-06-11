//
//  SpatialEndpoint.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import Foundation

struct SpatialEndpoint: Endpoint {
    let baseURL: URL = URL(string: "https://docs.google.com")!
    let path: String = "/document/d/e/2PACX-1vSvM5gDlNvt7npYHhp_XfsJvuntUhq184By5xO_pA4b_gCWeXb6dM6ZxwN8rE6S4ghUsCj2VKR21oEP/pub"
    let method: HTTPMethod = .get
    let requestAuthorization: RequestAuthorization = .publicEndpoint
}
