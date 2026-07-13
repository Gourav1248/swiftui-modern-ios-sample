import SwiftUI

import SwiftUI

struct TagListView: View {
   let tags: [StoreTagsModel]
   var onTapFilter: (() -> Void)? = nil
   var onSelectTag: ((StoreTagsModel) -> Void)? = nil

   var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
         HStack(spacing: 10) {
            Button(action: { onTapFilter?() }) {
               Image(systemName: "slider.horizontal.3")
                  .padding(8)
                  .background(Circle().fill(Color(.systemGray6)))
                  .foregroundColor(.black)
            }

            ForEach(tags, id: \.id) { tag in
               TagChipView(tag: tag)
                  .onTapGesture { onSelectTag?(tag) }
            }
         }
         .padding(.horizontal, 16)
      }
   }
}
