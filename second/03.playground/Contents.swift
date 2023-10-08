import UIKit

// enum

enum School {
    case elementary
    case middle
    case high
}

enum Grade:Int {
    case first = 1
    case second = 2
}

enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
}
extension SchoolDetail {
    func showSchoolNmae()->String {
        switch self {
        case .elementary(let name):
            return name
        case .middle(let name):
            return name
        case .high(let name):
            return name
        }
    }
}

let school:School = School.elementary
school

let grade:Int = Grade.first.rawValue
grade

let schoolName = SchoolDetail.middle(name: "seoulMiddleSchool").showSchoolNmae()
print(schoolName)
