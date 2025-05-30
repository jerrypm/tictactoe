import SwiftUI

// Game history row component
struct ITTTGameHistoryRow: View {
    let game: ITTTGameResultModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: .four) {
                Text(game.gameType)
                    .font(.system(size: .sixteen, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(game.date)
                    .font(.system(size: .twelve))
                    .foregroundColor(.gray)
            }
            .frame(width: .hundredThirty, alignment: .leading)
            .padding(.vertical, .twelve)
            .padding(.horizontal, .sixteen)
            
            Text(game.score)
                .font(.system(size: .twentyFour, weight: .bold))
                .foregroundColor(.white)
                .frame(width: .sixty)
            
            Spacer()
            
            Text(game.result.rawValue)
                .font(.system(size: .fourteen, weight: .medium))
                .foregroundColor(game.result == .win ? .black : .white)
                .padding(.horizontal, .twelve)
                .padding(.vertical, .four)
                .background(
                    Capsule()
                        .fill(game.result == .win ? Color(.colorPrimaryAi) : Color(.colorPrimaryUser))
                )
                .padding(.trailing, .sixteen)
        }
        .frame(height: .sixty)
        .background(Color.clear)
        .overlay(
            Rectangle()
                .frame(height: .one)
                .foregroundColor(Color.gray.opacity(.pointThree)),
            alignment: .bottom
        )
    }
}
