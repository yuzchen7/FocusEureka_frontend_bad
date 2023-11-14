//
//  ScheuleView.swift
//  FocusEureka
//
//  Created by yuz_chen on 11/7/23.
//

import SwiftUI

struct ScheuleView: View {
    
    @Binding var scheuleViewModel: ScheuleViewModel
    
    var body: some View {
        if let schedules = scheuleViewModel.schedule {
            VStack {
                // single scheule view
                ForEach(schedules.scheduleDay) {element in
                    SingleScheuleView(day: element.day, isAvailable: element.isAvaliable)
                }
            }
        }
    }
}

#Preview {
    let scheuleViewModel = ScheuleViewModel()
    scheuleViewModel.schedule?.scheduleDay = [
        ScheduleDay(day: "Sunday", isAvaliable: true),
        ScheduleDay(day: "Monday", isAvaliable: true),
        ScheduleDay(day: "Tuesday", isAvaliable: true),
        ScheduleDay(day: "Wednesday", isAvaliable: true),
        ScheduleDay(day: "Thursday", isAvaliable: true),
        ScheduleDay(day: "Firday", isAvaliable: true),
        ScheduleDay(day: "Saturday", isAvaliable: true)
    ]

    return ScheuleView(scheuleViewModel: .constant(scheuleViewModel))
}
