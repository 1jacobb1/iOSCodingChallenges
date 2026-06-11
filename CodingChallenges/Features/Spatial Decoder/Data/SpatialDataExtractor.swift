//
//  SpatialDataExtractor.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import Foundation

struct SpatialDataExtractor {
    func decryptMessage(htmlString: String) -> [String] {
        let coordinates: [(x: Int, y: Int, char: String)] = extractCoordinates(htmlString: htmlString)
        let maxX = coordinates.max(by: { $0.x < $1.x })?.x ?? 0
        let maxY = coordinates.max(by: { $0.y < $1.y })?.y ?? 0
        var grid: [[String]] = Array(repeating: Array(repeating: " ", count: maxX + 1), count: maxY + 1)
        coordinates.forEach { item in
            let char = item.char
            var newChar = char
            if char == "█"  {
                newChar = "|"
            } else if char == "░" {
                newChar = ":"
            }
            grid[item.y][item.x] = newChar
        }

        return grid.map { $0.joined() }
    }

    func extractCoordinates(htmlString: String) -> [(x: Int, y: Int, char: String)] {
        let trBlocks = extractTRBlocks(from: htmlString)
        var points: [(x: Int, y: Int, char: String)] = []
        for tr in trBlocks {
            let tds = extractTDValues(from: tr)
            if tds.count == 3 {
                if let x = Int(tds[0]), let y = Int(tds[2]) {
                    let char = tds[1]
                    points.append((x: x, y: y, char: char))
                }
            }
        }
        return points
    }

    func extractTRBlocks(from html: String) -> [String] {
        let pattern = "<tr[^>]*>(.*?)</tr>"
        let regex = try? NSRegularExpression(pattern: pattern, options: [.dotMatchesLineSeparators])

        let nsString = html as NSString
        let results = regex?.matches(in: html, options: [], range: NSRange(location: 0, length: nsString.length)) ?? []

        return results.map {
            nsString.substring(with: $0.range(at: 1))
        }
    }

    func extractTDValues(from trBlock: String) -> [String] {
        let pattern = "<t[dh][^>]*>(.*?)</t[dh]>"
        let regex = try? NSRegularExpression(pattern: pattern, options: [.dotMatchesLineSeparators])

        let nsString = trBlock as NSString
        let results = regex?.matches(in: trBlock, options: [], range: NSRange(location: 0, length: nsString.length)) ?? []

        return results.map {
            var value = nsString.substring(with: $0.range(at: 1))

            // Remove leftover HTML tags if any
            value = value.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)

            return value.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
}
