//
//  LiveStreamingInfo.swift
//  dallaUITest_mainView
//
//  Created by 조웅희 on 2023/10/14.
//

import Foundation

struct LiveStreamingInfo: DisplayableItem {
    var imageName: String = ""
    var miniImageName: String = ""
    var liveState: String = ""
    var title: String = ""
    var peopleCount: Int = 0
    var heartCount: Int = 0
    var boosterCount: Int = 0
    var djName: String = ""
    var gender: String = ""
    var bdgList: [String] = []
    var icoList: [String] = []
    var timeRanking: String = ""
    var isBooster: Bool = false
}
