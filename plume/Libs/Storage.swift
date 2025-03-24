//
//  Storage.swift
//  Plume
//
//  Created by Thomas Rademaker on 3/24/25.
//

import Foundation

enum StorageError: Error {
    case createURL
    case removeObject
    case clearDirectory
    case createURLError
}

struct Storage {
    enum Directory {
        /// Only documents and other data that is user-generated, or that cannot otherwise be recreated by your application, should be stored in the <Application_Home>/Documents directory and will be automatically backed up by iCloud.
        case documents
        
        /// Data that can be downloaded again or regenerated should be stored in the <Application_Home>/Library/Caches directory. Examples of files you should put in the Caches directory include database cache files and downloadable content, such as that used by magazine, newspaper, and map applications.
        case caches
    }
    
    /// Returns URL constructed from specified directory
    static func getURL(for directory: Directory) throws -> URL {
        var searchPathDirectory: FileManager.SearchPathDirectory
        
        switch directory {
        case .documents:
            searchPathDirectory = .documentDirectory
        case .caches:
            searchPathDirectory = .cachesDirectory
        }
        
        if let url = FileManager.default.urls(for: searchPathDirectory, in: .userDomainMask).first {
            return url
        } else {
            throw StorageError.createURL
        }
    }
    
    /// returns the URL location for the file name and directory
    static func url(for fileName: String, in directory: Directory) -> URL? {
        try? getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)
    }
    
    /// Store an encodable struct to the specified directory on disk
    ///
    /// - Parameters:
    ///   - data: the data to store
    ///   - directory: where to store the struct
    ///   - fileName: what to name the file where the struct data will be stored
    static func store(_ data: Data, to directory: Directory, as fileName: String) throws {
        guard !fileExists(fileName, in: directory) else { return }
        guard let url = try? getURL(for: directory).appendingPathComponent(fileName, isDirectory: false) else { throw StorageError.createURLError }
        try data.write(to: url, options: .completeFileProtection)
    }
    
    /// Remove specified file from specified directory
    static func remove(_ fileName: String, from directory: Directory) throws {
        guard !fileExists(fileName, in: directory) else { return }
        guard let url = try? getURL(for: directory).appendingPathComponent(fileName, isDirectory: false) else { throw StorageError.createURLError }
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            throw StorageError.removeObject
        }
    }
    
    /// Returns ``Bool`` indicating whether file exists at specified directory with specified file name
    static func fileExists(_ fileName: String, in directory: Directory) -> Bool {
        guard let url = try? getURL(for: directory).appendingPathComponent(fileName, isDirectory: false) else { return false }
        return FileManager.default.fileExists(atPath: url.path)
    }
    
    /// Remove all files at specified directory
    static func clear(_ directory: Directory) throws {
        guard let url = try? getURL(for: directory) else { return }
        let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
        
        for fileUrl in contents {
            try FileManager.default.removeItem(at: fileUrl)
        }
    }
}
