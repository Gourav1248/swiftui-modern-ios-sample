import SwiftUI

struct BannerCarouselView: View {
    let banners: StoreBannerDataModel
    @State private var currentIndex = 0

    var body: some View {
        VStack(spacing: 10) {
            TabView(selection: $currentIndex) {
               ForEach(Array((banners.storeBanners ?? []).enumerated()), id: \.element.id) { index, banner in
                    BannerCardView(banner: banner) {
                        // handle shop tap for this banner
                    }
                    .padding(.horizontal, 16)
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 190)

            HStack(spacing: 6) {
               ForEach(
                  (banners.storeBanners ?? []).indices
                  , id: \.self) { index in
                    Capsule()
                        .fill(index == currentIndex ? Color.indigo : Color.gray.opacity(0.3))
                        .frame(width: index == currentIndex ? 16 : 6, height: 6)
                }
            }
        }
    }
}
