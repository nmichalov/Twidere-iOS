//
//  AccountDetails.swift
//  Twidere
//
//  Created by Mariotaku Lee on 2017/5/4.
//  Copyright © 2017年 Mariotaku Dev. All rights reserved.
//

import PMJackson
import PMJSON

public class AccountDetails {
    
    var key: UserKey!
    
    var type: AccountType = .twitter
    
    var credentialsType: CredentialsType = .oauth
    
    var user: PersistableUser!
    
    var color: Int = 0
    
    var position: Int = 0
    
    var activated: Bool = false
    
    var _credentialsJson: String!
    var _credentials: Credentials!
    
    var _extrasJson: String!
    var _extras: Extras!
    
    var credentials: Credentials! {
        if (_credentials != nil) {
            return _credentials
        }
        guard let json = _credentialsJson else {
            return nil
        }
        var options = JSONParserOptions()
        options.streaming = true
        let parser = JsonParser(JSON.parser(for: json.data(using: .utf8)!, options: options))
        switch (credentialsType) {
        case .oauth:
            _credentials = OAuthCredentialsJsonMapper.singleton.parse(parser)
        default:
            break
        }
        return _credentials
    }
    
    
    public enum AccountType: String {
        case twitter = "twitter", statusnet = "statusnet", fanfou = "fanfou", mastodon = "mastodon"
    }
    
    public enum CredentialsType: String {
        case oauth = "oauth", xauth = "xauth", basic = "basic", empty = "empty", oauth2 = "oauth2"
    }
    
    //sourcery: jsonParse
    public class Credentials {
        //sourcery: jsonField=api_url_format
        var api_url_format: String!
        //sourcery: jsonField=no_version_suffix
        var no_version_suffix: Bool = false
        
        required public init() {
            
        }
    }
    
    //sourcery: jsonParse
    public class Extras {
        
        required public init() {
            
        }
    }
}