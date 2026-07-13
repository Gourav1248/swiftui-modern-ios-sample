import SwiftUI

struct StoreTopBarView: View {
    let countryFlag: String
    let cashbackAmount: String
    var onCountryTapped: () -> Void
    var onWishlistTapped: () -> Void
    var onSearchTapped: () -> Void

    var body: some View {
        HStack {
            Text("Store")
                .font(.title2.bold())

            Button(action: onCountryTapped) {
                HStack(spacing: 4) {
                    Text(countryFlag)
                    Image(systemName: "chevron.down")
                        .font(.caption2)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Capsule().fill(Color(.systemGray6)))
            }

            Spacer()

            HStack(spacing: 4) {
                Image(systemName: "cup.and.saucer.fill")
                    .foregroundColor(.indigo)
                Text(cashbackAmount)
                    .font(.subheadline.bold())
                    .foregroundColor(.indigo)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Capsule().stroke(Color.indigo.opacity(0.4)))

            Button(action: onWishlistTapped) {
                Image(systemName: "heart")
                    .foregroundColor(.black)
            }
            .padding(.leading, 10)

            Button(action: onSearchTapped) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
            }
            .padding(.leading, 10)
        }
        .padding(.horizontal, 16)
    }
}
