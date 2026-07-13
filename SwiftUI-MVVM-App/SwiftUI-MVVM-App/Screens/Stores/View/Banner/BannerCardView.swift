import SwiftUI

struct BannerCardView: View {
    let banner: BannersDataModel
    var onShopTapped: () -> Void

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .overlay(
                  RoundedRectangle(cornerRadius: 20)
                     .stroke(Color.gray.opacity(0.7), lineWidth: 1)
                )
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(banner.title ?? "")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Text(banner.subTitle ?? "")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.7))
                        .fixedSize(horizontal: false, vertical: true)

                    Button(action: onShopTapped) {
                        Text("Shop now")
                            .font(.subheadline.bold())
                            .foregroundColor(.indigo)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(
                                Capsule().stroke(Color.indigo, lineWidth: 1.5)
                            )
                    }
                    .padding(.top, 4)
                }
                .padding(20)

                Spacer(minLength: 0)
            }

           Image(banner.image?.url ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.trailing, 10)
                .padding(.bottom, -6)
        }
        .frame(height: 190)
        .clipped()
    }
}
