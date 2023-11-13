//
//  ScheuleView.swift
//  FocusEureka
//
//  Created by yuz_chen on 11/7/23.
//

import SwiftUI

struct ScheuleView: View {
    var schedule: Schedule = Schedule()
    
    var body: some View {
        VStack {
            // single scheule view
            ForEach(self.schedule.schedules) {element in
                SingleScheuleView(day: element.day, isAvailable: element.isAvaliable)
            }
        }
    }
}

#Preview {
    ScheuleView()
}
