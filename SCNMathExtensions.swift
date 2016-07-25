// SCNMathExtensions
// @copyright: Slipp Douglas Thompson
// @copyright date: The date(s) of version control check-ins corresponding to this file and this project as a whole; or in lieu of, no earlier than July 2016.

import SceneKit

import simd



// MARK: Type Conversions

extension SCNVector3 {
	public func toSimd() -> float3 {
		return SCNVector3ToFloat3(self)
	}
	public func toGLK() -> GLKVector3 {
		return SCNVector3ToGLKVector3(self)
	}
}
extension float3 {
	public func toSCN() -> SCNVector3 {
		return SCNVector3FromFloat3(self)
	}
}
extension GLKVector3 {
	public func toSCN() -> SCNVector3 {
		return SCNVector3FromGLKVector3(self)
	}
}

extension SCNQuaternion {
	public var q:(Float,Float,Float,Float) {
		return (self.x, self.y, self.z, self.w)
	}
	public init(q:(Float,Float,Float,Float)) {
		self.init(x: q.0, y: q.1, z: q.2, w: q.3)
	}
	
	public func toGLK() -> GLKQuaternion {
		return GLKQuaternion(q: self.q)
	}
}
extension GLKQuaternion {
	public func toSCN() -> SCNQuaternion {
		return SCNQuaternion(q: self.q)
	}
}



// MARK: SCNVector3 Extensions

extension SCNVector3
{
	public static func + (a:SCNVector3, b:SCNVector3) -> SCNVector3 { return a.added(to: b) }
	public func added(to other:SCNVector3) -> SCNVector3 {
		return (self.toSimd() + other.toSimd()).toSCN()
	}
	public static func += (v:inout SCNVector3, o:SCNVector3) { v.add(o) }
	public mutating func add(_ other:SCNVector3) {
		self = self.added(to: other)
	}
	
	public func crossed(by other:SCNVector3) -> SCNVector3 {
		return simd.cross(self.toSimd(), other.toSimd()).toSCN()
	}
	public mutating func cross(by other:SCNVector3) {
		self = self.crossed(by: other)
	}
	
	public static func / (a:SCNVector3, b:SCNVector3) -> SCNVector3 { return a.divided(by: b) }
	public func divided(by other:SCNVector3) -> SCNVector3 {
		return (self.toSimd() / other.toSimd()).toSCN()
	}
	public static func / (a:SCNVector3, b:Float) -> SCNVector3 { return a.divided(by: b) }
	public func divided(by scalar:Float) -> SCNVector3 {
		return (self.toSimd() * recip(scalar)).toSCN()
	}
	public static func /= (v:inout SCNVector3, o:SCNVector3) { v.divide(by: o) }
	public mutating func divide(by other:SCNVector3) {
		self = self.divided(by: other)
	}
	public static func /= (v:inout SCNVector3, o:Float) { v.divide(by: o) }
	public mutating func divide(by scalar:Float) {
		self = self.divided(by: scalar)
	}
	
	public func dot(by other:SCNVector3) -> Float {
		return simd.dot(self.toSimd(), other.toSimd())
	}
	
	public func magnitude() -> Float {
		return simd.length(self.toSimd())
	}
	public func magnitudeSquared() -> Float {
		return simd.length_squared(self.toSimd())
	}
	
	public func mixed(with other:SCNVector3, ratio:Float) -> SCNVector3 {
		return simd.mix(self.toSimd(), other.toSimd(), t: ratio).toSCN()
	}
	public mutating func mix(with other:SCNVector3, ratio:Float) {
		self = self.mixed(with: other, ratio: ratio)
	}
	
	public static func * (a:SCNVector3, b:SCNVector3) -> SCNVector3 { return a.multiplied(by: b) }
	public func multiplied(by other:SCNVector3) -> SCNVector3 {
		return (self.toSimd() * other.toSimd()).toSCN()
	}
	public static func * (a:SCNVector3, b:Float) -> SCNVector3 { return a.multiplied(by: b) }
	public func multiplied(by scalar:Float) -> SCNVector3 {
		return (self.toSimd() * scalar).toSCN()
	}
	public static func *= (v:inout SCNVector3, o:SCNVector3) { v.multiply(by: o) }
	public mutating func multiply(by other:SCNVector3) {
		self = self.multiplied(by: other)
	}
	public static func *= (v:inout SCNVector3, o:Float) { v.multiply(by: o) }
	public mutating func multiply(by scalar:Float) {
		self = self.multiplied(by: scalar)
	}
	
	public static prefix func - (v:SCNVector3) -> SCNVector3 { return v.inverted() }
	public func inverted() -> SCNVector3 {
		return (float3(0) - self.toSimd()).toSCN()
	}
	public mutating func invert() {
		self = self.inverted()
	}
	
	public func normalized() -> SCNVector3 {
		return simd.normalize(self.toSimd()).toSCN()
	}
	public mutating func normalize() {
		self = self.normalized()
	}
	
	public func projected(onto other:SCNVector3) -> SCNVector3 {
		return simd.project(self.toSimd(), other.toSimd()).toSCN()
	}
	public mutating func project(onto other:SCNVector3) {
		self = self.projected(onto: other)
	}
	
	public func reflected(normal:SCNVector3) -> SCNVector3 {
		return simd.reflect(self.toSimd(), n: normal.toSimd()).toSCN()
	}
	public mutating func reflect(normal:SCNVector3) {
		self = self.reflected(normal: normal)
	}
	
	public func refracted(normal:SCNVector3, refractiveIndex:Float) -> SCNVector3 {
		return simd.refract(self.toSimd(), n: normal.toSimd(), eta: refractiveIndex).toSCN()
	}
	public mutating func refract(normal:SCNVector3, refractiveIndex:Float) {
		self = self.refracted(normal: normal, refractiveIndex: refractiveIndex)
	}
	
	public static func - (a:SCNVector3, b:SCNVector3) -> SCNVector3 { return a.subtracted(by: b) }
	public func subtracted(by other:SCNVector3) -> SCNVector3 {
		return (self.toSimd() - other.toSimd()).toSCN()
	}
	public static func -= (v:inout SCNVector3, o:SCNVector3) { v.subtract(o) }
	public mutating func subtract(_ other:SCNVector3) {
		self = self.subtracted(by: other)
	}
}


extension SCNVector3 : Equatable
{
	public static func == (a:SCNVector3, b:SCNVector3) -> Bool {
		return SCNVector3EqualToVector3(a, b)
	}
}



// MARK: SCNQuaternion Extensions

extension SCNQuaternion
{
	init(from a:SCNVector3, to b:SCNVector3, opposing180Axis:SCNVector3=SCNVector3(0, 1, 0)) {
		let aNormal = a.normalized(), bNormal = b.normalized()
		let dotProduct = aNormal.dot(by: bNormal)
		if dotProduct >= 1.0 {
			self = GLKQuaternionIdentity.toSCN()
		}
		else if dotProduct < (-1.0 + Float.leastNormalMagnitude) {
			self = GLKQuaternionMakeWithAngleAndVector3Axis(Float.pi, opposing180Axis.toGLK()).toSCN()
		}
		else {
			if true {
				// version 1, from: http://stackoverflow.com/questions/1171849/finding-quaternion-representing-the-rotation-from-one-vector-to-another
				let xyz = aNormal.crossed(by: bNormal)
				(self.x, self.y, self.z) = (xyz.x, xyz.y, xyz.z)
				self.w = sqrt(aNormal.magnitudeSquared() * bNormal.magnitudeSquared()) + dotProduct
			} else {
				// version 2, from: https://bitbucket.org/sinbad/ogre/src/9db75e3ba05c/OgreMain/include/OgreVector3.h?fileviewer=file-view-default#OgreVector3.h-651
				let s = sqrt((1.0 + dotProduct) * 2.0)
				let sReciprocal = 1.0 / s
				let xyz = aNormal.crossed(by: bNormal) * sReciprocal
				(self.x, self.y, self.z) = (xyz.x, xyz.y, xyz.z)
				self.w = s * 0.5
			}
		}
	}
	
	
	public func angleAxis() -> (Float, SCNVector3) {
		let self_glk = self.toGLK()
		let angle = GLKQuaternionAngle(self_glk)
		let axis = SCNVector3FromGLKVector3(GLKQuaternionAxis(self_glk))
		return (angle, axis)
	}
	
	public func delta(_ other:SCNQuaternion) -> SCNQuaternion {
		return GLKQuaternionMultiply(GLKQuaternionInvert(self.toGLK()), other.toGLK()).toSCN()
	}
}
