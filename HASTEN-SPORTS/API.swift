

import Foundation

public enum API {
    
	case ListSports
	
	
}

extension API: Resource {
    
    var method: Method {
        switch self{
        case .ListSports:
            return Method.GET
        }
    }
    
    var bodyObjects: [String : Any] {
       return  [:]
    }
    
	
	public var path: String {
        
		switch self {
		case .ListSports:
			return "bins/66851"
        
        
		}
	}
	
	public var parameters: [String:String] {
        
		switch self {
        case   .ListSports:
            return [:]
		
        
		}

	}
	
}
