//
//  Repository.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/11.
//

import Foundation

enum Repository {
    
    static let mainTopProfileData = [
        TopMainProfile(imageName: "mainTopProfileImage1",
                       bdgImageName: "bdgStar",
                       title: "하늘 닮은 DJ 늘 사랑 받는아침방송1",
                       subtitle: "애 나𝒜𝓃𝓃𝒶 📻 🎧"),
        TopMainProfile(imageName: "mainTopProfileImage2",
                       bdgImageName: "bdgStar",
                       title: "하늘 닮은 DJ 늘 사랑 받는아침방송2",
                       subtitle: "애 나2"),
        TopMainProfile(imageName: "mainTopProfileImage3",
                       bdgImageName: "bdgStar",
                       title: "하늘 닮은 DJ 늘 사랑 받는아침방송3",
                       subtitle: "애 나3")
    ]
    
    static let followListData = [
        Follow(imageName: "ellipse7",
                   djName: "달대리찡",
                  isLiveStreamingOn: true),
        Follow(imageName: "ellipse7",
                   djName: "사랑이M̶",
                  isLiveStreamingOn: true),
        Follow(imageName: "ellipse7",
                   djName: "달라쑝",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡4",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡5",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡6",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡7",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡8",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡9",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡10",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡11",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡12",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡13",
                  isLiveStreamingOn: false),
        Follow(imageName: "ellipse7",
                   djName: "달래찡14",
                  isLiveStreamingOn: false),
    ]
    
    static let userRankingTop10Data = [
        UserRankingTop10(djName: "달대리찡",
                         imageName: "mainTopProfileImage1",
                         liveState:"btnMiniLive",
                         rankingNum: "numberW1"),
        UserRankingTop10(djName: "사랑이",
                         imageName: "mainTopProfileImage2",
                         liveState:"btnMiniListen",
                         rankingNum: "numberW2"),
        UserRankingTop10(djName: "달라쑝",
                         imageName: "mainTopProfileImage3",
                         liveState:"btnMiniListen",
                         rankingNum: "numberW3"),
        UserRankingTop10(djName: "달대리찡4",
                         imageName: "mainTopProfileImage2",
                         liveState:"btnMiniLive",
                         rankingNum: "numberW1"),
        UserRankingTop10(djName: "달대리찡5",
                         imageName: "mainTopProfileImage2",
                         liveState:"btnMiniListen",
                         rankingNum: "numberW1"),
        UserRankingTop10(djName: "달대리찡6",
                         imageName: "mainTopProfileImage2",
                         liveState:"btnMiniListen",
                         rankingNum: "numberW2"),
        UserRankingTop10(djName: "달대리찡7",
                         imageName: "mainTopProfileImage2",
                         liveState:"btnMiniLive",
                         rankingNum: "numberW2"),
        
    ]
    
    static let userNewBjData = [
        UserNewBj(imageName: "mainTopProfileImage2",
                  subTitle: "얄라리얄라숑"),
        UserNewBj(imageName: "mainTopProfileImage1",
                  subTitle: "한개두개세개"),
        UserNewBj(imageName: "mainTopProfileImage3",
                  subTitle: "개팔자가상팔자일까요?"),
        UserNewBj(imageName: "mainTopProfileImage1",
                  subTitle: "아이유 닮은저에게 박수를"),
        UserNewBj(imageName: "mainTopProfileImage1",
                  subTitle: "얄라리얄라숑"),
        UserNewBj(imageName: "mainTopProfileImage2",
                  subTitle: "얄라리얄라숑"),
        
    ]
    
    static let liveStreamingInfoData = [
        LiveStreamingInfo(imageName: "mainTopProfileImage2",
                          miniImageName: "mainTopProfileImage3",
                          liveState: "icoVideo",
                          title: "달빛 라이브 원 투 쓰리 포",
                          peopleCount: 6666,
                          heartCount: 777,
                          boosterCount: 99999,
                          djName: "쏭디제이",
                          gender: "icoMale",
                          bdgList: [
                            "badgeContents",
                            "bdgContents",
                            "bdgStar",
//                            "icoCupid01",
//                            "icoCupid02",
//                            "icoCupid03",
//                            "icoCupid02",
                          ],
                          icoList: [
                            "icoMale",
                            "icoFemale",
//                            "icoAlarmPoint",
                          ]),
//                          timeRanking: "aniTime01"
        LiveStreamingInfo(imageName: "mainTopProfileImage2",
                          miniImageName: "mainTopProfileImage3",
                          liveState: "icoVideo",
                          title: "달빛 라이브 원 투 쓰리 포",
                          peopleCount: 6666,
                          heartCount: 777,
                          boosterCount: 99999,
                          djName: "쏭디제이",
                          gender: "icoMale",
                          bdgList: [
                            "badgeContents",
                            "bdgContents",
                            "bdgStar",
//                            "icoCupid01",
//                            "icoCupid02",
//                            "icoCupid03"
                          ],
                          icoList: [
                            "icoMale",
                            "icoFemale",
//                            "icoAlarmPoint",
                          ]),
//                          timeRanking: "aniTime02"
        LiveStreamingInfo(imageName: "mainTopProfileImage1",
                          miniImageName: "mainTopProfileImage2",
//                          liveState: "icoVideo",
                          title: "하하하 하하하 하하하하하하하하하하하하하하하하하하하하하하하",
                          peopleCount: 66,
                          heartCount: 77,
                          boosterCount: 9999,
                          djName: "오늘하루",
                          gender: "icoFemale",
                          bdgList: [
//                            "badgeContents",
//                            "bdgContents",
                            "bdgStar",
//                            "icoCupid01",
//                            "icoCupid02",
//                            "icoCupid03"
                          ],
                          icoList: [
                            "icoMale"
                          ]
//                          timeRanking: "aniTime01"
                         ),
        LiveStreamingInfo(imageName: "mainTopProfileImage3",
//                          miniImageName: "mainTopProfileImage3",
//                          liveState: "icoVideo",
//                          title: "달빛 라이브 원 투 쓰리 포",
                          peopleCount: 616,
                          heartCount: 777,
                          boosterCount: 99999,
                          djName: "부스터맨",
                          gender: "icoMale",
                          bdgList: [
                            "badgeContents",
                            "bdgContents",
                            "bdgStar",
//                            "icoCupid01",
//                            "icoCupid02",
//                            "icoCupid03"
                          ],
                          icoList: [
                            "icoMale",
                            "icoFemale",
//                            "icoAlarmPoint",
                          ],
//                          timeRanking: "aniTime01",
                          isBooster: true),
        LiveStreamingInfo(imageName: "mainTopProfileImage2",
                          miniImageName: "mainTopProfileImage3",
                          liveState: "icoVideo",
                          title: "달빛 라이브 원 투 쓰리 포",
                          peopleCount: 6666,
                          heartCount: 777,
                          boosterCount: 99999,
                          djName: "쏭디제이 쏭디제이쏭디제이쏭디제이쏭디제이쏭디제이쏭디제이쏭디제이",
                          gender: "icoMale",
                          bdgList: [
                            "badgeContents",
                            "bdgContents",
                            "bdgStar",
//                            "icoCupid01",
//                            "icoCupid02",
//                            "icoCupid03"
                          ],
                          icoList: [
                            "icoMale",
                            "icoFemale",
//                            "icoAlarmPoint",
                          ]
//                          timeRanking: "aniTime01"
                         ),
        LiveStreamingInfo(imageName: "mainTopProfileImage2",
                          miniImageName: "mainTopProfileImage3",
                          liveState: "icoVideo",
                          title: "달빛 라이브 원 투 쓰리 포",
                          peopleCount: 6666,
                          heartCount: 77777,
                          boosterCount: 99999,
                          djName: "쏭디제이",
                          gender: "icoMale",
//                          bdgList: [
//                            "badgeContents",
//                            "bdgContents",
//                            "bdgStar",
//                            "icoCupid01",
//                            "icoCupid02",
//                            "icoCupid03"
//                          ],
                          icoList: [
                            "icoMale",
                            "icoFemale",
//                            "icoAlarmPoint",
                          ])
//                          timeRanking: "aniTime03"
    ]
    
}
