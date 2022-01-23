//
//  GoogleApiTest.swift
//  GoogleApiTest
//
//  Created by Devendra  Pandey on 21/01/22.
//

import XCTest

class GoogleApiTest: XCTestCase {

    
    var sut: URLSession!

    override func setUpWithError() throws {
      try super.setUpWithError()
      sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }

    
    // Asynchronous test: success fast, failure slow
    func testValidApiCallGetsHTTPStatusCode200() throws {
      // given
        /* https://newsapi.org */
        let API_KEY = "4f3736981e763d09fcdb131b08be5635"
        //https://gnews.io/api/v4/search?q=example&token=4f3736981e763d09fcdb131b08be5635&lang=en
        let url = URL(string: "https://gnews.io/api/v4/search?q=example&token=\(API_KEY)&lang=en")!
        
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
            print("Test Case sucessfully executed")
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }

}
