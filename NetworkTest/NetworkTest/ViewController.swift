//
//  ViewController.swift
//  NetworkTest
//
//  Created by Matt Green on 4/25/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit
import OAuthSwift

class ViewController: OAuthViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
    
func auth() {
    // create an instance and retain it
    let oauthswift = OAuth1Swift(
        consumerKey:    "********",
        consumerSecret: "********",
        requestTokenUrl: "https://api.twitter.com/oauth/request_token",
        authorizeUrl:    "https://api.twitter.com/oauth/authorize",
        accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
    )
    // authorize
    let handle = oauthswift.authorize(
        withCallbackURL: URL(string: "oauth-swift://oauth-callback/twitter")!,
        success: { credential, response, parameters in
            print(credential.oauthToken)
            print(credential.oauthTokenSecret)
            print(parameters["user_id"])
            // Do your request
    },
        failure: { error in
            print(error.localizedDescription)
    }
    )
}




