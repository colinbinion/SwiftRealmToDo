//
//  swiftModel.swift
//  ToDoListWithRealm
//
//  Created by Colin Binion on 10/24/16.
//  Copyright © 2016 Colin Binion. All rights reserved.
//

import Realm

class ToDoItem: RLMObject { // [2]

    dynamic var task = "" // [3]
}
