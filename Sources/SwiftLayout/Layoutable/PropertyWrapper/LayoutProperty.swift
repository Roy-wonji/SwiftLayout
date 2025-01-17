//
//  LayoutProperty.swift
//
//
//  Created by oozoofrog on 2022/03/06.
//

import Foundation

@propertyWrapper
public final class LayoutProperty<Value> {

    private var stored : Value
    
    public init(wrappedValue: Value) {
        stored = wrappedValue
    }
    
    public static subscript<Instance: Layoutable> (
        _enclosingInstance instance: Instance,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<Instance, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<Instance, LayoutProperty>
    ) -> Value {
        get {
            instance[keyPath: storageKeyPath].stored
        }
        set {
            instance[keyPath: storageKeyPath].stored = newValue
            instance.updateLayout()
        }
    }
    
    @available(*, unavailable, message: "This property wrapper can only be applied to Layoutable")
    public var wrappedValue: Value {
      get { fatalError() }
      set { fatalError() }
    }
}
