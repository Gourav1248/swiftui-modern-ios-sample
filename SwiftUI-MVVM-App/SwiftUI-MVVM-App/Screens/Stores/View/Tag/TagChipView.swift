import SwiftUI

struct TagChipView: View {
    let tag: StoreTagsModel

    var body: some View {
        HStack(spacing: 4) {
//           if let icon = tag.icon {
//              AsyncImage(url: URL(string: icon.url ?? "")) { image in
//                 image
//                    .resizable()
//                    .scaledToFit()
//              } placeholder: {
//                 ProgressView()
//              }
//              .frame(width: 14, height: 14)
//           }
            Text(tag.tag ?? "")
                .font(.caption.weight(.medium))
                .foregroundColor(tag.isSelected ?? false ? .white : .black)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(tag.isSelected ?? false ? Color.indigo : Color(.systemGray6))
        )
    }
}
