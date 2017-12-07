//
//  Post.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 06/12/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Post {
    
    private var _postKey: String!
    private var _postCaption: String!
    private var _postDate: String!
    private var _imageUrl: String!
    private var _postUser: String!
    private var _postRef: DatabaseReference!
    
    var postKey: String {
        return _postKey
    }
    var postCaption: String {
        return _postCaption
    }
    var postDate: String {
        return _postDate
    }
    var postUser: String {
        return _postUser
    }
    var imageUrl: String {
        return _imageUrl
    }
    
    init(caption: String, imageUrl: String, date: String) {
        self._postCaption = caption
        self._imageUrl = imageUrl
        self._postDate = date
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let user = postData["user"] as? String {
            self._postUser = user
        }
        if let caption = postData["caption"] as? String {
            self._postCaption = caption
        }
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        if let date = postData["date"] as? String {
            self._postDate = date
        }
        
        _postRef = DataService.ds.REF_POSTS.child(_postKey)
    }
    
    
    
}
