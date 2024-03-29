package pixelimage.algo;

import pixelimage.iter.BoundIterator;
import pixelimage.iter.IteratorRange;

@:structInit
class HitTri implements IhitObj {
    public var ax: Float;
    public var ay: Float;
    public var bx: Float;
    public var by: Float;
    public var cx: Float;
    public var cy: Float;
    public var preCalculated: Bool;
    var s0: Float;
    var sx: Float;
    var sy: Float;
    var t0: Float;
    var tx: Float;
    var ty: Float;
    var A:  Float;
    public var xIter3: IteratorRange;
    public var yIter3: IteratorRange;
    public var undoImage: Null<Pixelimage> = null;
    public var undoX: Int;
    public var undoY: Int;
    inline
    public function new( ax: Float, ay: Float
                       , bx: Float, by: Float
                       , cx: Float, cy: Float, preCalculated: Bool = true ){
        var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
        if( !adjustWinding ){
            var bx_ = bx;
            var by_ = by;
            bx = cx;
            by = cy;
            cx = bx_;
            cy = by_;
        }
        this.ax = ax;
        this.ay = ay;
        this.bx = bx;
        this.by = by;
        this.cx = cx;
        this.cy = cy;
        this.preCalculated = preCalculated;
        if( preCalculated ){
            preCalculateValues();
        }
    }
    inline 
    public function preCalculateValues(){
        s0 = ay*cx - ax*cy;
        sx = cy - ay;
        sy = ax - cx;
        t0 = ax*by - ay*bx;
        tx = ay - by;
        ty = bx - ax;
        A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy; 
        xIter3 = boundIterator3( ax, bx, cx );
        yIter3 = boundIterator3( ay, by, cy );
    }

    inline 
    public function hit( x: Float, y: Float ): Bool {
        return if( xIter3.containsF( x ) && yIter3.containsF( y ) ){
            var s = s0 + sx*x + sy*y;
            var t = t0 + tx*x + ty*y;
            if( s <= 0 || t <= 0 ){
                false;
            } else {
                ( (s + t) < A )? true: false;
            }
        } else {
            false;
        }
    }
}