// MIT license. Copyright (c) 2015 SwiftyFORM. All rights reserved.
import Foundation

public class StaticTextFormItem: FormItem {
	override func accept(_ visitor: FormItemVisitor) {
		visitor.visitStaticText(self)
	}
	
	public var title: String = ""

	@discardableResult
	public func title(_ title: String) -> Self {
		self.title = title
		return self
	}
	

	typealias SyncBlock = (value: String) -> Void
	var syncCellWithValue: SyncBlock = { (string: String) in
		SwiftyFormLog("sync is not overridden")
	}
	
	internal var innerValue: String = ""
	public var value: String {
		get {
			return self.innerValue
		}
		set {
			innerValue = newValue
			syncCellWithValue(value: innerValue)
		}
	}
	@discardableResult
	public func value(_ value: String) -> Self {
		self.value = value
		return self
	}
}
