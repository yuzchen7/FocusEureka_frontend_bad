//
//  Scheule.swift
//  AuthTutorial
//
//  Created by yuz_chen on 11/7/23.
//

import Foundation

class Schedule: Identifiable {
    // tesing data
    @Published var schedules: [ScheduleDay] = [
        ScheduleDay(day: "Sunday", isAvaliable: true),
        ScheduleDay(day: "Monday", isAvaliable: true),
        ScheduleDay(day: "Tuesday", isAvaliable: true),
        ScheduleDay(day: "Wednesday", isAvaliable: true),
        ScheduleDay(day: "Thursday", isAvaliable: true),
        ScheduleDay(day: "Friday", isAvaliable: true),
        ScheduleDay(day: "Saturday", isAvaliable: true)
    ]
}

struct ScheduleDay: Identifiable {
    var id: Int = UUID().hashValue
    var day: String
    var isAvaliable: Bool
}
