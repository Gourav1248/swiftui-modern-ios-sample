import SwiftUI

struct TagChipView: View {

   let tag: StoreTagsModel
   let isSelected: Bool

   var body: some View {

      Text(tag.tag ?? "")
         .padding(.horizontal, 14)
         .padding(.vertical, 8)
         .background(
            isSelected ? Color.blue : Color.gray.opacity(0.2)
         )
         .foregroundColor(
            isSelected ? .white : .black
         )
         .clipShape(Capsule())
   }
}
