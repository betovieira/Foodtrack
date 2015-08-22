//
//  Alert.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/22/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import Foundation
import UIKit

func alertError(title: String, description: String) {
    TWMessageBarManager.sharedInstance().showMessageWithTitle(title, description: description, type: TWMessageBarMessageType.Error, statusBarStyle:UIStatusBarStyle.LightContent, callback:nil)
}

func alertSucess(title: String, description: String) {
    TWMessageBarManager.sharedInstance().showMessageWithTitle(title, description: description, type: TWMessageBarMessageType.Error, statusBarStyle:UIStatusBarStyle.LightContent, callback:nil)
}

func alertInfo(title: String, description: String) {
    TWMessageBarManager.sharedInstance().showMessageWithTitle(title, description: description, type: TWMessageBarMessageType.Error, statusBarStyle:UIStatusBarStyle.LightContent, callback:nil)
}