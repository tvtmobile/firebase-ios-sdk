// Copyright 2023 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

/**
    Utility type for constructing federated auth provider credentials.
 */
@objc(FIRFederatedAuthProvider) public protocol FederatedAuthProvider: NSObjectProtocol {
  #if os(iOS)
    /** @fn getCredentialWithUIDelegate:completion:
        @brief Used to obtain an auth credential via a mobile web flow.
            This method is available on iOS only.
        @param UIDelegate An optional UI delegate used to present the mobile web flow.
        @param completion Optionally; a block which is invoked asynchronously on the main thread when
            the mobile web flow is completed.
     */
    @objc(getCredentialWithUIDelegate:completion:)
    func getCredentialWith(_ UIDelegate: AuthUIDelegate?,
                           completion: ((AuthCredential?, Error?) -> Void)?)

    /** @fn getCredentialWithUIDelegate:completion:
        @brief Used to obtain an auth credential via a mobile web flow.
            This method is available on iOS only.
        @param UIDelegate An optional UI delegate used to present the mobile web flow.
        @param completion Optionally; a block which is invoked asynchronously on the main thread when
            the mobile web flow is completed.
     */
    @available(iOS 13, tvOS 13, macOS 10.15, watchOS 8, *)
    func credential(with UIDelegate: AuthUIDelegate?) async throws -> AuthCredential

  #endif
}
